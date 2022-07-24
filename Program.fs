namespace Maui

open System
open System.ComponentModel
open System.IO
open System.IO.Compression
open System.Net.Http
open Newtonsoft.Json

type [<JsonConverter (typeof<PackKeyJsonConverter>) ; TypeConverter (typeof<PackKeyTypeConverter>)>] PackKey =
    | PackKey of string
    /// Human-readable round-trippable representation
    override this.ToString () =
        match this with
        | PackKey p -> p
and PackKeyJsonConverter () =
    inherit JsonConverter<PackKey> ()
    override _.ReadJson (reader : JsonReader, objectType : Type, _existingValue : PackKey, _ : bool, _ : JsonSerializer) =
        if objectType <> typeof<PackKey> then
            failwith $"Unexpected object type for pack key: {objectType}"
        let value = reader.Value |> unbox<string>
        PackKey value
    override _.WriteJson (_ : JsonWriter, _ : PackKey, _ : JsonSerializer) : unit =
        failwith "do not call"
and PackKeyTypeConverter () =
    inherit TypeConverter ()
    override _.CanConvertFrom (_, t : Type) : bool =
        t = typeof<string>
    override _.ConvertFrom (_, _, v : obj) : obj =
        v |> unbox<string> |> PackKey |> box

type [<JsonConverter (typeof<WorkloadKeyJsonConverter>) ; TypeConverter (typeof<WorkloadKeyTypeConverter>)>] WorkloadKey =
    | WorkloadKey of string
and WorkloadKeyJsonConverter () =
    inherit JsonConverter<WorkloadKey> ()
    override _.ReadJson (reader : JsonReader, objectType : Type, _existingValue : _, _ : bool, _ : JsonSerializer) : WorkloadKey =
        if objectType <> typeof<WorkloadKey> then
            failwith $"Unexpected object type for workload key: {objectType}"
        let value = reader.Value |> unbox<string> |> WorkloadKey
        value
    override _.WriteJson (_ : JsonWriter, _ : WorkloadKey, _ : JsonSerializer) : unit =
        failwith "do not call"
and WorkloadKeyTypeConverter () =
    inherit TypeConverter ()
    override _.CanConvertFrom (_, t : Type) : bool =
        t = typeof<string>
    override _.ConvertFrom (_, _, v : obj) : obj =
        v |> unbox<string> |> WorkloadKey |> box

type WorkloadManifest =
    {
        /// e.g. ".NET MAUI SDK for all platforms"
        Description : string
        /// e.g. ["maui-blazor"]
        Extends : WorkloadKey list
        /// e.g. ["Microsoft.MAUI.Dependencies"]
        Packs : PackKey list
    }

type [<JsonConverter (typeof<PackManifestKindJsonConverter>) ; TypeConverter (typeof<PackManifestKindTypeConverter>)>] PackManifestKind =
    | Library
    | Framework
    | Sdk
    | Template
    static member Parse (value : string) =
        match value with
        | "library" -> PackManifestKind.Library
        | "sdk" -> PackManifestKind.Sdk
        | "framework" -> PackManifestKind.Framework
        | "template" -> PackManifestKind.Template
        | _ -> failwith $"Unexpected value in pack manifest kind: {value}"

and PackManifestKindJsonConverter () =
    inherit JsonConverter<PackManifestKind> ()
    override _.ReadJson (reader : JsonReader, objectType : Type, _existingValue : PackManifestKind, _ : bool, _ : JsonSerializer) : PackManifestKind =
        if objectType <> typeof<PackManifestKind> then
            failwith $"Unexpected object type for pack manifest kind: {objectType}"
        PackManifestKind.Parse (reader.Value |> unbox<string>)
    override _.WriteJson (_ : JsonWriter, _ : PackManifestKind, _ : JsonSerializer) : unit =
        failwith "do not call"
and PackManifestKindTypeConverter () =
    inherit TypeConverter ()
    override _.CanConvertFrom (_, t : Type) : bool =
        t = typeof<string>
    override _.ConvertFrom (_, _, v : obj) : obj =
        v |> unbox<string> |> PackManifestKind.Parse |> box


type PackManifest =
    {
        Kind : PackManifestKind
        Version : Version
    }

type Manifest =
    {
        Version : Version
        Workloads : Map<WorkloadKey, WorkloadManifest>
        Packs : Map<PackKey, PackManifest>
    }


module Program =
    let source =
        let dir = DirectoryInfo "/nix/store/4qhpk4hixrmdg7rrkblppbm8s4alj6xl-dotnet-sdk-6.0.301/"
        dir.EnumerateFiles ("*.nupkg", SearchOption.AllDirectories)
        |> Seq.map (fun fi -> fi.Name.Substring(0, fi.Name.Length - ".nupkg".Length).ToLowerInvariant(), fi)
        |> readOnlyDict

    let fetchZip (client : HttpClient) (uri : Uri) : Stream Async =
        async {
            let! ct = Async.CancellationToken
            let! s = Async.AwaitTask (client.GetStreamAsync (uri, ct))
            return s
        }

    let fetchPackage (client : HttpClient) (PackKey packKey) (version : Version) : Async<Stream> =
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
                failwith $"Unexpected version, wanted {version.ToString()} but cached {v.Directory.Name}"
        | false, _ ->
        let uri = Uri $"https://www.nuget.org/api/v2/package/{packKey}/{version}"
        fetchZip client uri

    /// Download the specified nupkg and parse out the dependencies it implies.
    let fetchManifest (client : HttpClient) (manifest : Uri) : Manifest Async =
        async {
            use! arch =
                if manifest.Scheme = "file" then
                    async {
                        let stream = File.OpenRead (manifest.ToString().Substring("file://".Length))
                        return new ZipArchive(stream)
                    }
                else
                    async {
                        let! s = fetchZip client manifest
                        return new ZipArchive(s)
                    }
            let deps = arch.GetEntry "data/WorkloadManifest.json"
            let! entry =
                async {
                    use entry = new System.IO.StreamReader (deps.Open ())
                    return! entry.ReadToEndAsync () |> Async.AwaitTask
                }
            return JsonConvert.DeserializeObject<Manifest> entry
        }

    let foldAsync<'state, 'value> (f : 'state -> 'value -> 'state Async) (s : 'state) (inputs : 'value seq) : 'state Async =
        async {
            use e = inputs.GetEnumerator ()
            let rec go (value : 'state) =
                async {
                    if e.MoveNext () then
                        let! value = f value e.Current
                        return! go value
                    else
                        return value
                }
            return! go s
        }

    /// A NuGet package such as "Microsoft.Maui.Controls.Ref.android".
    /// The installation procedure for this is to unpack it into /packs
    /// at Name/Version
    type Framework =
        {
            Name : PackKey
            Version : Version
            /// The bytes of a zip file.
            Data : Stream
        }

    /// A NuGet package such as "Microsoft.AspNetCore.Components.WebView.Maui".
    /// The installation procedure for this is to copy directly into /library-packs
    /// at <lowercase package name>.<version>.nupkg
    type Library =
        {
            Name : PackKey
            Version : Version
            /// The bytes of a zip file.
            Data : Stream
        }

    /// A NuGet package such as "Microsoft.Maui.Templates-6.0".
    /// This gets copied directly into template-packs as a nupkg, and not extracted
    type Template =
        {
            Name : PackKey
            Version : Version
            /// The bytes of a zip file.
            Data : Stream
        }

    /// A NuGet package such as "Microsoft.Maui.Sdk".
    /// The installation procedure for this is to unpack it into /packs
    /// at Name/Version
    type Sdk =
        {
            Name : PackKey
            Version : Version
            /// The bytes of a zip file.
            Data : Stream
        }

    type State =
        {
            Frameworks : Framework list
            Libraries : Library list
            Templates : Template list
            Sdks : Sdk list
        }
        static member Empty : State =
            {
                Frameworks = []
                Libraries = []
                Templates = []
                Sdks = []
            }

    [<RequireQualifiedAccess>]
    module State =
        let addFramework (f : Framework) (s : State) =
            { s with
                Frameworks = f :: s.Frameworks
            }
        let addTemplate (f : Template) (s : State) =
            { s with
                Templates = f :: s.Templates
            }
        let addLibrary (f : Library) (s : State) =
            { s with
                Libraries = f :: s.Libraries
            }
        let addSdk (f : Sdk) (s : State) =
            { s with
                Sdks = f :: s.Sdks
            }

    /// baseDir is the top-level folder, e.g. /nix/store/4qhpk4hixrmdg7rrkblppbm8s4alj6xl-dotnet-sdk-6.0.301
    /// This function consumes the stream in the input Framework.
    let installFramework (baseDir : DirectoryInfo) (f : Framework) =
        let dest =
            Path.Combine (baseDir.FullName, "packs", f.Name.ToString (), f.Version.ToString ())
            |> DirectoryInfo
        // put the package there, and also extract it there
        dest.Create ()
        use z = new ZipArchive(f.Data)
        z.ExtractToDirectory (dest.ToString ())
        f.Data.Seek (0, SeekOrigin.Begin) |> ignore
        use target = File.OpenWrite (Path.Combine (dest.FullName, $"{f.Name}.nupkg"))
        f.Data.CopyTo target

    /// baseDir is the top-level folder, e.g. /nix/store/4qhpk4hixrmdg7rrkblppbm8s4alj6xl-dotnet-sdk-6.0.301
    /// This function consumes the stream in the input Sdk.
    let installSdk (baseDir : DirectoryInfo) (s : Sdk) =
        let dest =
            Path.Combine (baseDir.FullName, "packs", s.Name.ToString (), s.Version.ToString ())
            |> DirectoryInfo
        // put the package there, and also extract it there
        dest.Create ()
        use z = new ZipArchive(s.Data)
        z.ExtractToDirectory (dest.ToString ())
        s.Data.Seek (0, SeekOrigin.Begin) |> ignore
        use target = File.OpenWrite (Path.Combine (dest.FullName, $"{s.Name}.nupkg"))
        s.Data.CopyTo target

    /// baseDir is the top-level folder, e.g. /nix/store/4qhpk4hixrmdg7rrkblppbm8s4alj6xl-dotnet-sdk-6.0.301
    /// This function consumes the stream in the input Template.
    let installTemplate (baseDir : DirectoryInfo) (t : Template) =
        let dest =
            Path.Combine (baseDir.FullName, "template-packs", $"{t.Name.ToString().ToLowerInvariant()}.{t.Version.ToString ()}.nupkg")
            |> FileInfo
        dest.Directory.Create ()
        use target = dest.OpenWrite ()
        t.Data.CopyTo target

    /// baseDir is the top-level folder, e.g. /nix/store/4qhpk4hixrmdg7rrkblppbm8s4alj6xl-dotnet-sdk-6.0.301
    /// This function consumes the stream in the input Library.
    let installLibrary (baseDir : DirectoryInfo) (l : Library) =
        let dest =
            Path.Combine (baseDir.FullName, "library-packs", $"{l.Name.ToString().ToLowerInvariant()}.{l.Version.ToString ()}.nupkg")
            |> FileInfo
        dest.Directory.Create ()
        use target = dest.OpenWrite ()
        l.Data.CopyTo target

    let flatten (client : HttpClient) (manifest : Manifest) : State Async =
        (State.Empty, Map.toSeq manifest.Packs)
        ||> foldAsync (fun state (packKey, manifest) ->
            async {
                let! package = fetchPackage client packKey manifest.Version
                match manifest.Kind with
                | PackManifestKind.Framework ->
                    // e.g. "Microsoft.Maui.Controls.Ref.android"
                    // TODO I think these can't have dependencies?
                    return
                        state
                        |> State.addFramework
                            {
                                Name = packKey
                                Data = package
                                Version = manifest.Version
                            }
                | PackManifestKind.Library ->
                    // Ignore nuget installs
                    return state |> State.addLibrary { Name = packKey ; Data = package ; Version = manifest.Version }
                | PackManifestKind.Template ->
                    return state |> State.addTemplate { Name = packKey ; Data = package ; Version = manifest.Version }
                | PackManifestKind.Sdk ->
                    return state |> State.addSdk { Name = packKey ; Data = package ; Version = manifest.Version }
            }
        )

    let writeState (baseDir : DirectoryInfo) (s : State) : unit =
        s.Templates
        |> List.iter (installTemplate baseDir)
        s.Frameworks
        |> List.iter (installFramework baseDir)
        s.Sdks
        |> List.iter (installSdk baseDir)
        s.Libraries
        |> List.iter (installLibrary baseDir)

    let dotnet =
        Path.Combine (typeof<int>.Assembly.Location, "..", "..", "..", "..", "bin", "dotnet")
        |> FileInfo

    let printAvailableWorkloads () =
        let availableWorkloads =
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
                System.Text.Json.JsonSerializer.Deserialize<Uri list> desired
            | _ ->
                failwith $"Unexpected formatting: {output}"

        availableWorkloads
        |> Seq.map (fun s -> s.ToString ())
        |> String.concat "\n"
        |> printfn "%s"

    [<EntryPoint>]
    let main argv =
        use client = new HttpClient ()

        let manifest, flattened =
            async {
                let! manifest =
                    // Uri "https://api.nuget.org/v3-flatcontainer/microsoft.net.sdk.maui.manifest-6.0.300/6.0.419/microsoft.net.sdk.maui.manifest-6.0.300.6.0.419.nupkg"
                    Uri "file:///Users/patrick/Downloads/microsoft.net.sdk.maui.manifest-6.0.300.6.0.419.nupkg"
                    |> fetchManifest client
                let! flattened = flatten client manifest
                return manifest, flattened
            }
            |> Async.RunSynchronously

        match argv with
        | [||] -> 0
        | _ ->

        let baseDir = dotnet.Directory.Parent

        writeState baseDir flattened

        0