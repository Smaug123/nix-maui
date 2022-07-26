namespace MauiDotnetFlake

open System
open System.IO
open System.Security.Cryptography
open FSharp.Collections.ParallelSeq

type State =
    {
        Packs : Pack list
        WorkloadName : string option
    }
    static member Empty (workloadName : string option) : State =
        {
            Packs = []
            WorkloadName = workloadName
        }

[<RequireQualifiedAccess>]
module State =
    let addPack (f : Pack) (s : State) =
        { s with
            Packs = f :: s.Packs
        }

    let write (baseDir : DirectoryInfo) (s : State) : unit =
        s.Packs
        |> PSeq.iter (Install.install baseDir)

        let metadataDir = Path.Combine (baseDir.FullName, "metadata", "workloads")
        // TODO fix this version number
        match s.WorkloadName with
        | None -> ()
        | Some workloadName ->
            let workloadFile =
                Path.Combine (metadataDir, "6.0.300", "InstalledWorkloads", workloadName)
                |> FileInfo
            workloadFile.Directory.Create ()
            workloadFile.Create () |> ignore

    let chopEnd (chop : string) (s : string) =
        if s.EndsWith chop then
            s.Substring (0, s.Length - chop.Length)
        else
            failwith "chop failed to chop"

    let getHash =
        let c = SHA256.Create ()
        fun (stream : Stream) ->
            c.ComputeHash stream
            |> Convert.ToBase64String

    /// Convert a string into a form suitable for use as a Nix identifier.
    let private nixName (s : string) : string =
        s.Replace(".", "")

    let toNix (manifestNupkg : FileInfo) (manifest : Manifest) (state : State) : string =
        // TODO fix domain
        let workloadName = Option.get state.WorkloadName
        let spaces = "    "
        let workloadPacks =
            state.Packs
            |> Seq.map (fun f -> f.Name)
            |> Seq.map (fun (PackKey p) -> nixName p)
            |> String.concat $"\n{spaces}"

        let nupkgName =
            chopEnd $".{manifest.Version}.nupkg" manifestNupkg.Name

        let hash =
            use s = manifestNupkg.OpenRead ()
            getHash s

        let primary =
            $"""{workloadName} = buildDotnetWorkload (sdkVersion: rec {{
  pname = "{workloadName}";
  version = "{manifest.Version}";
  src = fetchNuGet {{
    pname = "{nupkgName}";
    inherit version;
    hash = "sha256-{hash}";
  }};
  workloadName = "{workloadName}";
  workloadPacks = [
{spaces}{workloadPacks}
  ];
}});"""

        let secondaries =
            state.Packs
            |> List.map (fun l ->
                let (PackKey name) = l.Name
                $"""{nixName name} = buildDotnetPack rec {{
  pname = "{name}";
  version = "{l.Version}";
  kind = "{l.Type.ToString ()}";
  src = fetchNuGet {{
    inherit pname version;
    hash = "sha256-{getHash l.Data}";
  }};
}};"""
            )

        let allSecondaries =
            secondaries
            |> String.concat "\n"

        $"{primary}\n{allSecondaries}"