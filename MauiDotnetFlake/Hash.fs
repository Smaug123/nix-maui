namespace MauiDotnetFlake

open System
open System.IO
open System.Security.Cryptography

[<RequireQualifiedAccess>]
module Hash =
    let private c = SHA256.Create ()

    let getAsync (stream : Stream) =
        stream.Seek (0, SeekOrigin.Begin) |> ignore
        async {
            let! ct = Async.CancellationToken
            let! hash = c.ComputeHashAsync (stream, ct) |> Async.AwaitTask
            return
                hash
                |> Convert.ToBase64String
                |> HashString
        }

    let get (s : Stream) = getAsync s |> Async.RunSynchronously