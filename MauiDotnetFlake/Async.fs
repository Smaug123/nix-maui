namespace MauiDotnetFlake

[<RequireQualifiedAccess>]
module Async =

    let map<'a, 'b> (f : 'a -> 'b) (x : Async<'a>) : Async<'b> =
        async {
            let! x = x
            return f x
        }
