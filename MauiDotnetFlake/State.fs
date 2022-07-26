namespace MauiDotnetFlake

open System.IO
open FSharp.Collections.ParallelSeq

type State =
    {
        Frameworks : Framework list
        Libraries : Library list
        Templates : Template list
        Sdks : Sdk list
        WorkloadName : string option
    }
    static member Empty (workloadName : string option) : State =
        {
            Frameworks = []
            Libraries = []
            Templates = []
            Sdks = []
            WorkloadName = workloadName
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

    let write (baseDir : DirectoryInfo) (s : State) : unit =
        s.Templates
        |> PSeq.iter (Install.template baseDir)
        s.Frameworks
        |> PSeq.iter (Install.framework baseDir)
        s.Sdks
        |> PSeq.iter (Install.sdk baseDir)
        s.Libraries
        |> PSeq.iter (Install.library baseDir)

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

