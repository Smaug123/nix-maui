namespace MauiDotnetFlake

open System
open System.IO
open System.IO.Compression
open System.Net.Http
open Newtonsoft.Json

module Program =
    let source =
        let dir = DirectoryInfo "/tmp/pkgs/"
        if not dir.Exists then dir.Create ()
        dir.EnumerateFiles ("*.nupkg", SearchOption.AllDirectories)
        |> Seq.map (fun fi -> fi.Name.Substring(0, fi.Name.Length - ".nupkg".Length).ToLowerInvariant(), fi)
        |> readOnlyDict

    let fetchZip (client : HttpClient) (uri : Uri) : Stream Async =
        async {
            let! ct = Async.CancellationToken
            try
                let! s = Async.AwaitTask (client.GetStreamAsync (uri, ct))
                return s
            with
            | e ->
                return raise (AggregateException(uri.ToString (), e))
        }

    let rec waitForReady (file : FileInfo) : Async<Stream> =
        async {
            try
                return file.OpenRead () :> Stream
            with
            | e ->
                if e.Message.Contains "is being used by another process" then
                    do! Async.Sleep (TimeSpan.FromSeconds 5.0)
                    return! waitForReady file
                else
                    return raise e
        }

    let fetchPackageStream (client : HttpClient) (PackKey packKey) (version : Version) : Async<Stream> =
        let download =
            lazy
                let uri = Uri $"https://www.nuget.org/api/v2/package/{packKey}/{version}"
                async {
                    try
                        use! zip = fetchZip client uri
                        let destFile = $"/tmp/pkgs/{packKey.ToLowerInvariant()}.{version}.nupkg"
                        try
                            do
                                use dest = File.OpenWrite destFile
                                zip.CopyTo dest
                            return File.OpenRead destFile :> Stream
                        with
                        | e ->
                            if e.Message.Contains "is being used by another process" then
                                return! waitForReady (FileInfo destFile)
                            else
                                return raise e
                    with
                    | e ->
                        return raise (AggregateException(uri.ToString (), e))
                }

        match source.TryGetValue $"{packKey.ToLowerInvariant()}.{version}" with
        | true, v ->
            async {
                let s = v.OpenRead ()
                return s
            }
        | false, _ ->

        match source.TryGetValue $"{packKey.ToLowerInvariant()}" with
        | true, v ->
            if v.Directory.Name = version.ToString () then
                async {
                    let s = v.OpenRead ()
                    return s
                }
            else
                //failwith $"Unexpected version, wanted {version.ToString()} but cached {v.Directory.Name}"
                download.Force ()
        | false, _ ->
            download.Force ()

    let fetchPackageHash (client : HttpClient) (packKey : PackKey) (version : Version) : Async<HashString> =
        async {
            use! stream = fetchPackageStream client packKey version
            return! Hash.getAsync stream
        }

    let fetchManifest' (contents : Stream) : Manifest Async =
        async {
            use arch = new ZipArchive (contents)
            let deps = arch.GetEntry "data/WorkloadManifest.json"
            let! entry =
                async {
                    use entry = new StreamReader (deps.Open ())
                    return! entry.ReadToEndAsync () |> Async.AwaitTask
                }
            return JsonConvert.DeserializeObject<Manifest> entry
        }


    /// Download the specified nupkg and parse out the dependencies it implies.
    let fetchManifest (manifest : FileInfo) : Manifest Async =
        async {
            use s = manifest.OpenRead ()
            return! fetchManifest' s
        }

    let flatten (client : HttpClient) (workloadName : WorkloadKey option) (manifest : Manifest) : State Async =
        manifest.Packs
        |> Map.toSeq
        |> Seq.collect (fun (packKey, packManifest) ->
            match packManifest.AliasTo with
            | null ->
                Seq.singleton None
            | map ->
                map
                |> Seq.map (fun (KeyValue(platform, pack)) -> Some (Platform platform, PackKey pack))
            |> Seq.map (fun platform ->
                match platform with
                | None ->
                    async {
                        let! packageHash = fetchPackageHash client packKey packManifest.Version
                        return
                            None,
                            {
                                Name = packKey
                                Hash = packageHash
                                Version = packManifest.Version
                                Type = packManifest.Kind
                            }
                    }
                | Some (platform, resolvedPack) ->
                    async {
                        let! packageHash = fetchPackageHash client resolvedPack packManifest.Version
                        return
                            Some (platform, packKey),
                            {
                                Name = resolvedPack
                                Hash = packageHash
                                Version = packManifest.Version
                                Type = packManifest.Kind
                            }
                    }
            )
        )
        |> Async.Parallel
        |> Async.map (Array.fold (fun state (platform, pack)->
            match platform with
            | None ->
                State.addPack pack state
            | Some (platform, beforeResolution) ->
                State.addAlias platform beforeResolution pack state
            ) (State.Empty workloadName))

    let dotnet =
        Path.Combine (typeof<int>.Assembly.Location, "..", "..", "..", "..", "bin", "dotnet")
        |> FileInfo

    let allAvailableWorkloads () =
        let psi = System.Diagnostics.ProcessStartInfo (dotnet.FullName, Arguments = "workload update --print-download-link-only --sdk-version 6.0.301")
        psi.RedirectStandardError <- true
        psi.RedirectStandardOutput <- true
        use pr = new System.Diagnostics.Process()
        pr.StartInfo <- psi
        if not (pr.Start ()) then
            failwith $"failed to start {dotnet}"
        pr.WaitForExit ()
        let output = pr.StandardOutput.ReadToEnd ()

        match output.Split("==") with
        | [| _ ; "allPackageLinksJsonOutputStart" ; desired ; "allPackageLinksJsonOutputEnd" ; "\n" |] ->
            System.Text.Json.JsonSerializer.Deserialize<string list> desired
            |> List.map (fun uri ->
                match uri.Split "/" with
                | [| "https:" ; "" ; "api.nuget.org" ; "v3-flatcontainer" ; package ; version ; _path |] ->
                    {| Package = package ; Version = version |}, Uri uri
                | _ -> failwith $"Unrecognised URL format: {uri}"
            )
            |> Map.ofList
        | _ ->
            failwith $"Unexpected formatting: {output}"

    let requiredWorkloads (w : WorkloadKey) (m : Manifest) : WorkloadKey Set =
        let rec go (toAcc : WorkloadKey list) (results : WorkloadKey Set) =
            match toAcc with
            | [] -> results
            | x :: toAcc ->
                match Map.tryFind x m.Workloads with
                | None ->
                    go toAcc (Set.add x results)
                | Some found ->
                    if Object.ReferenceEquals (null, found.Extends) then
                        go toAcc results
                    else
                        go (found.Extends @ toAcc) results
        go [w] Set.empty


    /// Find the manifests which define a given WorkloadKey.
    let collate
        (manifests : seq<WorkloadCollation>)
        : Map<WorkloadKey, WorkloadCollation>
        =
        manifests
        |> Seq.collect (fun collation ->
            collation.Manifest.Workloads
            |> Map.toSeq
            |> Seq.map (fun (workload, _manifest) ->
                workload, collation
            )
        )
        |> Seq.groupBy fst
        |> Seq.map (fun (key, values) ->
            // Here is the assertion that each WorkloadKey is defined in exactly one workload
            key, Seq.map snd values |> Seq.exactlyOne
        )
        |> Map.ofSeq

    /// Render this workload as Nix, and also return our dependency workloads
    let renderWorkload
        (client : HttpClient)
        (allAvailableWorkloads : Map<WorkloadKey, WorkloadCollation>)
        (desiredWorkload : WorkloadKey)
        : Async<NixInfo * WorkloadKey Set>
        =
        let collation =
            match Map.tryFind desiredWorkload allAvailableWorkloads with
            | None -> failwith $"You gave us {desiredWorkload} but there's no workload with that name"
            | Some collation -> collation

        let requiredWorkloads = requiredWorkloads desiredWorkload collation.Manifest
        async {
            let! flattened = flatten client (Some desiredWorkload) collation.Manifest
            return State.toNix collation flattened, requiredWorkloads
        }

    let collectAllRequiredWorkloads
        (client : HttpClient)
        (allAvailableWorkloads : Map<WorkloadKey, WorkloadCollation>)
        (desiredWorkload : WorkloadKey)
        : Async<NixInfo>
        =
        let rec go (required : Set<WorkloadKey>) (state : _) =
            async {
                if required.IsEmpty then
                    return state
                else
                    let desiredWorkload, rest = required.MaximumElement, Set.remove required.MaximumElement required
                    let! thisTop, required = renderWorkload client allAvailableWorkloads desiredWorkload
                    return! go (Set.union required rest) (NixInfo.merge state thisTop)
            }

        async {
            let! topLevel, required = renderWorkload client allAvailableWorkloads desiredWorkload
            return! go required topLevel
        }

    [<EntryPoint>]
    let main argv =
        // e.g. "maui"
        let desiredWorkload =
            match argv with
            | [| w |] -> WorkloadKey w
            | _ -> failwith $"bad args: {argv}"

        use client = new HttpClient ()

        async {
            let! allAvailableWorkloads =
                allAvailableWorkloads ()
                |> Map.toSeq
                |> Seq.map (fun (ident, uri) ->
                    async {
                        let! ct = Async.CancellationToken
                        use! s = Async.AwaitTask (client.GetStreamAsync uri)
                        use ms = new MemoryStream ()
                        do! Async.AwaitTask (s.CopyToAsync (ms, ct))
                        let! hash = Hash.getAsync ms
                        ms.Seek (0, SeekOrigin.Begin) |> ignore
                        let! manifest = fetchManifest' ms
                        return
                            {
                                Package = ident.Package
                                Version = ident.Version
                                Hash = hash
                                Manifest = manifest
                            }
                    }
                )
                |> Async.Parallel
            let allAvailableWorkloads = collate allAvailableWorkloads

            let! nixInfo = collectAllRequiredWorkloads client allAvailableWorkloads desiredWorkload

            do!
                File.WriteAllTextAsync ("/Users/patrick/Documents/GitHub/maui-dotnet-flake/manifest.nix", nixInfo |> NixInfo.toString)
                |> Async.AwaitTask

            return 0
        }
        |> Async.RunSynchronously