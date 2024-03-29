namespace MauiDotnetFlake

open System

type State =
    {
        Packs : Map<PackKey, Pack>
        WorkloadName : WorkloadKey option
        /// A map of before-alias-resolution to the available resolutions.
        Aliases : Map<PackKey, Map<Platform, Pack>>
        Dependencies : Map<WorkloadKey, WorkloadKey Set>
    }
    static member Empty (workloadName : WorkloadKey option) : State =
        {
            Packs = Map.empty
            WorkloadName = workloadName
            Aliases = Map.empty
            Dependencies = Map.empty
        }

type NixName =
    private
    | NixName of string
    override this.ToString () =
        match this with
        | NixName s -> s

    static member Make (s : string) =
        s.Replace('.', '_')
        |> NixName

    static member Make (PackKey s) =
        s.Replace('.', '_')
        |> NixName

type NixExpression =
    | NixExpression of string
    override this.ToString () =
        match this with
        | NixExpression s -> s

type NixInfo =
    {
        Workloads : Map<NixName, NixExpression>
        Packs : Map<NixName, NixExpression>
        Aliases : Map<PackKey, Map<Platform, PackKey * Version>>
        Dependencies : Map<WorkloadKey, WorkloadKey Set>
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
        let aliases =
            this.Aliases
            |> Map.toSeq
            |> Seq.map (fun (unAliased, resolutions) ->
                let resolveMap =
                    resolutions
                    |> Map.toSeq
                    |> Seq.map (fun (platform, (resolved, version)) ->
                        let name =
                            $"{resolved}-{version}"
                            |> NixName.Make
                        $"\"{platform}\" = {name};"
                    )
                    |> String.concat "\n"
                    |> sprintf "{%s}"
                $"{NixName.Make unAliased} = {resolveMap};"
            )
            |> String.concat "\n"
        $"{workloads}\n{packs}\n{aliases}"

[<RequireQualifiedAccess>]
module NixInfo =
    let empty =
        {
            Aliases = Map.empty
            Workloads = Map.empty
            Packs = Map.empty
            Dependencies = Map.empty
        }

    let private assertEqual<'a when 'a : equality> (x : 'a) (y : 'a) : 'a =
        if x = y then x else failwith $"duplicate found: {x}\n{y}\n-----\n"

    let merge (n1 : NixInfo) (n2 : NixInfo) : NixInfo =
        let workloads = Map.union assertEqual n1.Workloads n2.Workloads
        let packs = Map.union assertEqual n1.Packs n2.Packs
        let aliases = Map.union (Map.union assertEqual) n1.Aliases n2.Aliases
        let dependencies = Map.union assertEqual n1.Dependencies n2.Dependencies
        {
            Workloads = workloads
            Packs = packs
            Aliases = aliases
            Dependencies = dependencies
        }

    let addDependency desired m (n : NixInfo) : NixInfo =
        { n with
            Dependencies =
                n.Dependencies
                |> Map.change desired (function | None -> Some m | Some s -> failwith "err")
        }

    let toString (n : NixInfo) : string =
        $"""{{ buildDotnetWorkload, fetchNuGet, buildDotnetPack }}: rec {{
{n}
}}"""

[<RequireQualifiedAccess>]
module State =
    let addPack (f : Pack) (s : State) =
        { s with
            Packs = s.Packs |> Map.add f.Name f
        }
    let addAlias (platform : Platform) (beforeAliasResolution : PackKey) (resolved : Pack) (s : State) =
        { s with
            Aliases =
                s.Aliases
                |> Map.change
                    beforeAliasResolution
                    (function
                        | None -> Map.ofList [platform, resolved] |> Some
                        | Some existing -> existing |> Map.add platform resolved |> Some
                    )
        }

    let chopEnd (chop : string) (s : string) =
        if s.EndsWith chop then
            s.Substring (0, s.Length - chop.Length)
        else
            failwith "chop failed to chop"

    let toNix
        (collation : WorkloadCollation)
        (state : State)
        : NixInfo
        =
        // TODO fix domain
        let nixWorkloadName =
            Option.get state.WorkloadName
            |> fun (WorkloadKey s) -> $"{s}-{collation.Manifest.Version}"
            |> NixName.Make
        let workloadName = Option.get state.WorkloadName |> fun (WorkloadKey s) -> s
        let spaces = "    "
        let workloadPacks =
            state.Packs.Values
            |> Seq.map (fun f -> $"{f.Name}-{f.Version}")
            |> Seq.map NixName.Make
            |> Seq.map string<NixName>
            |> Seq.sort
            |> String.concat $"\n{spaces}"
        let aliases =
            state.Aliases.Keys
            |> Seq.map NixName.Make
            |> Seq.map string<NixName>
            |> Seq.sort
            |> String.concat $"\n{spaces}"

        let primary =
            let nugetName =
                collation.Package.Substring(0, collation.Package.IndexOf '-')
                |> chopEnd ".manifest"
            //$"""buildDotnetWorkload (sdkVersion: rec {{
            $"""rec {{
  pname = "{nixWorkloadName}";
  version = "{collation.Manifest.Version}";
  src = fetchNuGet {{
    pname = "{collation.Package}";
    inherit version;
    hash = "sha256-{collation.Hash}";
  }};
  workloadName = "{workloadName}";
  nugetName = "{nugetName}";
  workloadPacks = [
{spaces}{workloadPacks}
{spaces}{aliases}
  ];
}};"""
        let primary = NixExpression primary

        let secondaries =
            state.Packs.Values
            |> Seq.append (state.Aliases.Values |> Seq.collect (fun p -> p.Values))
            |> Seq.sortBy (fun p -> p.Name)
            |> Seq.map (fun l ->
                let (PackKey name) = l.Name
                let nixName = NixName.Make $"{name}-{l.Version}"
                let originalName =
                    match l.OriginalName with
                    | None -> l.Name
                    | Some n -> n
                let output = $"""buildDotnetPack rec {{
  pname = "{name}";
  version = "{l.Version}";
  originalKey = "{originalName}";
  kind = "{l.Type.ToString ()}";
  src = fetchNuGet {{
    inherit pname version;
    hash = "sha256-{l.Hash}";
  }};
}};"""
                nixName, NixExpression output
            )
            |> Map.ofSeq

        {
            Workloads = Map.ofList [nixWorkloadName, primary]
            Packs = secondaries
            Aliases =
                state.Aliases
                |> Map.map (fun _ -> Map.map (fun _ v -> v.Name, v.Version))
            Dependencies = state.Dependencies
        }