namespace MauiDotnetFlake

[<RequireQualifiedAccess>]
module Seq =

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

