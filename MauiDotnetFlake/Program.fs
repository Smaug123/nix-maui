namespace MauiDotnetFlake

open System
open System.IO
open System.IO.Compression
open System.Net.Http
open System.Runtime.InteropServices
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

    let fetchPackage (client : HttpClient) (PackKey packKey) (version : Version) : Async<Stream> =
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

    let flatten (client : HttpClient) (workloadName : string option) (manifest : Manifest) : State Async =
        (State.Empty workloadName, Map.toSeq manifest.Packs)
        ||> Seq.foldAsync (fun state (packKey, manifest) ->
            let packKey =
                match manifest.AliasTo with
                | null -> Some packKey
                | map ->
                    let rid =
                        if RuntimeInformation.IsOSPlatform OSPlatform.Linux then
                            $"linux-{RuntimeInformation.OSArchitecture.ToString().ToLowerInvariant()}"
                        elif RuntimeInformation.IsOSPlatform OSPlatform.OSX then
                            $"osx-{RuntimeInformation.OSArchitecture.ToString().ToLowerInvariant()}"
                        else
                            failwith "Unrecognised platform"
                    match map.TryGetValue rid with
                    | false, _ ->
                        // Skip, it's not available for this platform
                        //map.Keys
                        //|> String.concat ","
                        //|> failwithf "Unknown platform for %O, needed one of: %s" packKey
                        None
                    | true, alias ->
                        PackKey alias
                        |> Some

            match packKey with
            | None -> async.Return state
            | Some packKey ->

            async {
                let! package = fetchPackage client packKey manifest.Version
                let package =
                    let s = new MemoryStream()
                    package.CopyTo s
                    package.Dispose ()
                    s.Seek (0, SeekOrigin.Begin) |> ignore
                    s
                return
                    state
                    |> State.addPack
                        {
                            Name = packKey
                            Data = package
                            Version = manifest.Version
                            Type = manifest.Kind
                        }
            }
        )

    let dotnet =
        Path.Combine (typeof<int>.Assembly.Location, "..", "..", "..", "..", "bin", "dotnet")
        |> FileInfo

    let printAvailableWorkloads () =
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

    [<EntryPoint>]
    let main argv =
        let pathToManifestNupkg, workloadName =
            match argv with
            | [| arg ; workloadName |] -> FileInfo arg, workloadName
            | _ -> failwith $"bad args: {argv}"

        async {
            use client = new HttpClient ()

            let! manifest, flattened =
                async {
                    let! manifest = fetchManifest pathToManifestNupkg
                    let requiredWorkloads = requiredWorkloads (WorkloadKey workloadName) manifest
                    let! flattened = flatten client (Some workloadName) manifest
                    return manifest, flattened
                }

            State.toNix pathToManifestNupkg manifest flattened
            |> printfn "%s"

            return 0
        }
        |> Async.RunSynchronously