namespace MauiDotnetFlake

[<RequireQualifiedAccess>]
module Map =

    let union<'k, 'v when 'k : comparison> (merge : 'v -> 'v -> 'v) (m1 : Map<'k, 'v>) (m2 : Map<'k, 'v>) =
        (m1, m2)
        ||> Map.fold (fun acc k v ->
            acc
            |> Map.change k (function
                | None -> Some v
                | Some v2 -> Some (merge v v2)
            )
        )

