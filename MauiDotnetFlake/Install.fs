namespace MauiDotnetFlake

open System.IO
open System.IO.Compression
open Newtonsoft.Json

[<RequireQualifiedAccess>]
module Install =

    /// baseDir is the top-level folder, e.g. /nix/store/<blah>-dotnet-sdk-6.0.301
    /// This function consumes the stream in the input Framework.
    let framework (baseDir : DirectoryInfo) (f : Framework) =
        let dest =
            Path.Combine (baseDir.FullName, "packs", f.Name.ToString (), f.Version.ToString ())
            |> DirectoryInfo
        let targetPath = Path.Combine (dest.FullName, $"{f.Name}.nupkg") |> FileInfo
        if targetPath.Exists then () else
        // put the package there, and also extract it there
        dest.Create ()
        use z = new ZipArchive(f.Data)
        z.ExtractToDirectory (dest.ToString ())
        f.Data.Seek (0, SeekOrigin.Begin) |> ignore
        use target = targetPath.OpenWrite ()
        f.Data.CopyTo target
        // The nupkg contains a lot of random crap as well which we don't want
        Directory.Delete (Path.Combine (dest.FullName, "_rels"), true)
        Directory.Delete (Path.Combine (dest.FullName, "package"), true)
        File.Delete (Path.Combine (dest.FullName, "[Content_Types].xml"))

        // Register the installation
        let metadataDir = Path.Combine (baseDir.FullName, "metadata", "workloads")
        do
            let workloadFile =
                // TODO fix version number
                let versionNumber = "6.0.300"
                // TODO where is this v1 coming from, and does it need fixing
                Path.Combine (metadataDir, "InstalledPacks", "v1", f.Name.ToString (), f.Version.ToString (), versionNumber)
                |> FileInfo
            workloadFile.Directory.Create ()
            let registration =
                {
                    Id = f.Name
                    Version = f.Version
                    Kind = Framework
                    // TODO must this change?
                    ResolvedPackageId = f.Name
                    Path = targetPath.Directory.FullName
                    // TODO the original install had 'true' here even though it is actually
                    // also unpacked?
                    IsStillPacked = true
                }
            File.WriteAllText (workloadFile.FullName, JsonConvert.SerializeObject registration)

    /// baseDir is the top-level folder, e.g. /nix/store/<blah>-dotnet-sdk-6.0.301
    /// This function consumes the stream in the input Sdk.
    let sdk (baseDir : DirectoryInfo) (s : Sdk) =
        let dest =
            Path.Combine (baseDir.FullName, "packs", s.Name.ToString (), s.Version.ToString ())
            |> DirectoryInfo
        let targetPath = Path.Combine (dest.FullName, $"{s.Name}.nupkg") |> FileInfo
        if targetPath.Exists then () else
        // put the package there, and also extract it there
        dest.Create ()
        use z = new ZipArchive(s.Data)
        z.ExtractToDirectory (dest.ToString ())
        s.Data.Seek (0, SeekOrigin.Begin) |> ignore
        use target = targetPath.OpenWrite ()
        s.Data.CopyTo target
        // The nupkg contains a lot of random crap as well which we don't want
        Directory.Delete (Path.Combine (dest.FullName, "_rels"), true)
        Directory.Delete (Path.Combine (dest.FullName, "package"), true)
        File.Delete (Path.Combine (dest.FullName, "[Content_Types].xml"))

        // Register the installation
        let metadataDir = Path.Combine (baseDir.FullName, "metadata", "workloads")
        do
            let workloadFile =
                // TODO fix version number
                let versionNumber = "6.0.300"
                // TODO where is this v1 coming from, and does it need fixing
                Path.Combine (metadataDir, "InstalledPacks", "v1", s.Name.ToString (), s.Version.ToString (), versionNumber)
                |> FileInfo
            workloadFile.Directory.Create ()
            let registration =
                {
                    Id = s.Name
                    Version = s.Version
                    Kind = Sdk
                    // TODO must this change?
                    ResolvedPackageId = s.Name
                    Path = targetPath.Directory.FullName
                    // TODO the original install had 'true' here even though it is actually
                    // also unpacked?
                    IsStillPacked = true
                }
            File.WriteAllText (workloadFile.FullName, JsonConvert.SerializeObject registration)

    /// baseDir is the top-level folder, e.g. /nix/store/<blah>-dotnet-sdk-6.0.301
    /// This function consumes the stream in the input Template.
    let template (baseDir : DirectoryInfo) (t : Template) =
        let dest =
            Path.Combine (baseDir.FullName, "template-packs", $"{t.Name.ToString().ToLowerInvariant()}.{t.Version.ToString ()}.nupkg")
            |> FileInfo
        dest.Directory.Create ()
        use target = dest.OpenWrite ()
        t.Data.CopyTo target

        // Register the installation
        let metadataDir = Path.Combine (baseDir.FullName, "metadata", "workloads")
        do
            let workloadFile =
                // TODO fix version number
                let versionNumber = "6.0.300"
                // TODO where is this v1 coming from, and does it need fixing
                Path.Combine (metadataDir, "InstalledPacks", "v1", t.Name.ToString (), t.Version.ToString (), versionNumber)
                |> FileInfo
            workloadFile.Directory.Create ()
            let registration =
                {
                    Id = t.Name
                    Version = t.Version
                    Kind = Template
                    // TODO must this change?
                    ResolvedPackageId = t.Name
                    Path = dest.FullName
                    // TODO I think maybe they've just got this bool wrong? This is definitely
                    // still zipped up, but the default install says False
                    IsStillPacked = false
                }
            File.WriteAllText (workloadFile.FullName, JsonConvert.SerializeObject registration)

    /// baseDir is the top-level folder, e.g. /nix/store/<blah>-dotnet-sdk-6.0.301
    /// This function consumes the stream in the input Library.
    let library (baseDir : DirectoryInfo) (l : Library) =
        let dest =
            Path.Combine (baseDir.FullName, "library-packs", $"{l.Name.ToString().ToLowerInvariant()}.{l.Version.ToString ()}.nupkg")
            |> FileInfo
        dest.Directory.Create ()
        use target = dest.OpenWrite ()
        l.Data.CopyTo target

        // Register the installation
        let metadataDir = Path.Combine (baseDir.FullName, "metadata", "workloads")
        do
            let workloadFile =
                // TODO fix version number
                let versionNumber = "6.0.300"
                // TODO where is this v1 coming from, and does it need fixing
                Path.Combine (metadataDir, "InstalledPacks", "v1", l.Name.ToString (), l.Version.ToString (), versionNumber)
                |> FileInfo
            workloadFile.Directory.Create ()
            let registration =
                {
                    Id = l.Name
                    Version = l.Version
                    Kind = Library
                    // TODO must this change?
                    ResolvedPackageId = l.Name
                    Path = dest.FullName
                    // TODO I think maybe they've just got this bool wrong? This is definitely
                    // still zipped up, but the default install says False
                    IsStillPacked = false
                }
            File.WriteAllText (workloadFile.FullName, JsonConvert.SerializeObject registration)

