namespace MauiDotnetFlake

open System
open System.IO
open System.Security.Cryptography
open FSharp.Collections.ParallelSeq

type State =
    {
        Packs : Pack list
        WorkloadName : WorkloadKey option
    }
    static member Empty (workloadName : WorkloadKey option) : State =
        {
            Packs = []
            WorkloadName = workloadName
        }

type NixName =
    private
    | NixName of string
    override this.ToString () =
        match this with
        | NixName s -> s

    static member Make (s : string) =
        s.Replace(".", "")
        |> NixName

type NixInfo =
    {
        Workloads : Map<NixName, string>
        Packs : Map<NixName, string>
    }
    override this.ToString () =
        let workloads =
            this.Workloads
            |> Map.toSeq
            |> Seq.map (fun (nixName, body) -> $"{nixName} = {body}")
            |> String.concat "\n"
        let packs =
            this.Packs
            |> Map.toSeq
            |> Seq.map (fun (nixName, body) -> $"{nixName} = {body}")
            |> String.concat "\n"
        $"{workloads}\n{packs}"

[<RequireQualifiedAccess>]
module NixInfo =
    let merge (n1 : NixInfo) (n2 : NixInfo) : NixInfo =
        {
            Workloads = Map.union (fun v1 v2 -> if v1 = v2 then v1 else failwith "duplicate found") n1.Workloads n2.Workloads
            Packs = Map.union (fun v1 v2 -> if v1 = v2 then v1 else failwith "duplicate found") n1.Packs n2.Packs
        }

    let toString (n : NixInfo) : string = n.ToString ()

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
        | Some (WorkloadKey workloadName) ->
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

    let toNix
        (manifestPackage : {| Package : string ; Version : string |})
        (hashBase64 : string)
        (manifest : Manifest)
        (state : State)
        : NixInfo
        =
        // TODO fix domain
        let workloadName =
            Option.get state.WorkloadName
            |> fun (WorkloadKey s) -> s
            |> NixName.Make
        let spaces = "    "
        let workloadPacks =
            state.Packs
            |> Seq.map (fun f -> f.Name)
            |> Seq.map (fun (PackKey p) -> NixName.Make p |> fun s -> s.ToString ())
            |> String.concat $"\n{spaces}"

        let primary =
            $"""buildDotnetWorkload (sdkVersion: rec {{
  pname = "{workloadName}";
  version = "{manifest.Version}";
  src = fetchNuGet {{
    pname = "{manifestPackage.Package}";
    inherit version;
    hash = "sha256-{hashBase64}";
  }};
  workloadName = "{workloadName}";
  workloadPacks = [
{spaces}{workloadPacks}
  ];
}});"""

        let secondaries =
            state.Packs
            |> Seq.map (fun l ->
                let (PackKey name) = l.Name
                let nixName = NixName.Make name
                let output = $"""buildDotnetPack rec {{
  pname = "{name}";
  version = "{l.Version}";
  kind = "{l.Type.ToString ()}";
  src = fetchNuGet {{
    inherit pname version;
    hash = "sha256-{getHash l.Data}";
  }};
}};"""
                nixName, output
            )
            |> Map.ofSeq

        {
            Workloads = Map.ofList [workloadName, primary]
            Packs = secondaries
        }