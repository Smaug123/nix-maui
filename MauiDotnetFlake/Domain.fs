namespace MauiDotnetFlake

open System
open System.Collections.Immutable
open System.ComponentModel
open System.IO
open Newtonsoft.Json

type [<JsonConverter (typeof<PackKeyJsonConverter>) ; TypeConverter (typeof<PackKeyTypeConverter>)>] PackKey =
    | PackKey of string
    /// Human-readable round-trip representation
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
    override _.WriteJson (writer : JsonWriter, PackKey key, _ : JsonSerializer) : unit =
        writer.WriteValue key
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
        match value.ToLowerInvariant () with
        | "library" -> PackManifestKind.Library
        | "sdk" -> PackManifestKind.Sdk
        | "framework" -> PackManifestKind.Framework
        | "template" -> PackManifestKind.Template
        | _ -> failwith $"Unexpected value in pack manifest kind: {value}"
    member this.ToInt =
        match this with
        | Library -> 2
        | Framework -> 1
        | Sdk -> 0
        | Template -> 3

and PackManifestKindJsonConverter () =
    inherit JsonConverter<PackManifestKind> ()
    override _.ReadJson (reader : JsonReader, objectType : Type, _existingValue : PackManifestKind, _ : bool, _ : JsonSerializer) : PackManifestKind =
        if objectType <> typeof<PackManifestKind> then
            failwith $"Unexpected object type for pack manifest kind: {objectType}"
        PackManifestKind.Parse (reader.Value |> unbox<string>)
    override _.WriteJson (w : JsonWriter, v : PackManifestKind, _ : JsonSerializer) : unit =
        w.WriteValue v.ToInt
and PackManifestKindTypeConverter () =
    inherit TypeConverter ()
    override _.CanConvertFrom (_, t : Type) : bool =
        t = typeof<string>
    override _.CanConvertTo (_, t : Type) : bool =
        t = typeof<int>
    override _.ConvertFrom (_, _, v : obj) : obj =
        v |> unbox<string> |> PackManifestKind.Parse |> box
    override _.ConvertTo (_, _, v : obj, _destType : Type) : obj =
        (v |> unbox<PackManifestKind>).ToInt

type PackManifest =
    {
        Kind : PackManifestKind
        Version : Version
        /// Map of "win-x64": "nuget-package-name", for example
        [<JsonProperty "alias-to">]
        AliasTo : ImmutableDictionary<string, string>
    }

type Manifest =
    {
        Version : Version
        Workloads : Map<WorkloadKey, WorkloadManifest>
        Packs : Map<PackKey, PackManifest>
    }

type Registration =
    {
        Id : PackKey
        Version : Version
        Kind : PackManifestKind
        ResolvedPackageId : PackKey
        Path : string
        IsStillPacked : bool
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

