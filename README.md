# MAUI and Nix

This is a cobbled-together and barely-working Nix flake in which it is possible to create and build a MAUI project.

## Steps to demonstrate the proof of concept

1. `nix develop`
1. `dotnet new maui --name MauiTest && cd MauiTest`
1. Since I haven't included the Android dependencies (they are currently commented in, but the `darwin-aarch64` architecture lacks an Android SDK in nixpkgs), I have to `rm -r Platforms/Android && sed -i 's/net6.0-android//g' MauiTest.csproj`. You may need to do some work to get the Android SDK.
1. `dotnet build`.

## Gotchas
Since I haven't done much work to encode the dependencies between workloads, the only way you'll know if you've missed out a required workload from the list you install in your flake is if the build fails.
Moreover, the build message is extremely unhelpful: even if you've installed the `maccatalyst` workload, for example, if you've missed out the `manifest.microsoft-net-runtime-maccatalyst-7_0_2` workload (which is a dependency) and you try and build a MacCatalyst app, you're liable to get a message that just says the `maccatalyst` workload must be installed.
In future, we should actually encode these dependencies in Nix and resolve them properly.

## How to generate the manifest files

The accompanying F# project is used to generate the `workload-manifest-list.nix` and `workload-manifest-contents.nix` files.
You call it with:

```
dotnet run --project maui-dotnet-flake.fsproj 6.0.301 /Users/patrick/Documents/GitHub/maui-dotnet-flake
```

Here the `6.0.301` is the SDK version for which we are requesting a complete manifest of available SDK workloads, and the output path is the path where we write the manifest `.nix` files.

Note that this will download a lot of NuGet packages.
By default it will do so into `/tmp/pkgs` (see the start of `Program.fs` for the local cache logic), but this was only so that my local development loop was shortened; there is no consistency checking of any kind (so e.g. if you change SDK versions, the cache is not invalidated), so you may wish to flip `LOCAL_CACHE` to `false`.

### `workload-manifest-contents.nix`

This is a complete listing of each .NET workload you can install, the dependent NuGet packages for each workload, and the alias resolutions for per-platform packages.

### `workload-manifest-list.nix`

This is a complete listing of each NuGet package that defines an SDK manifest, but with no dependencies.
This is required because .NET somehow knows which manifests are *meant* to be there, even if you're never going to use them, and it complains unless all these packages are present in its `sdk-manifests` folder (which they are by default, except that we're upgrading them from the default in the course of installing a workload).

## Known bugs

* There is likely something wrong with the composition of SDK workloads. I've seen the current setup stop working entirely if I remove the `android` manifest, although oddly enough my most recent attempt Just Worked.
* You have to just magically know which workloads you need to install. In fact the dependency information is encoded in the NuGet packages, but I have not done anything to help you there; you simply have to try it with `[manifest.maui]` and see it fail so that you know you also need e.g. `[manifest.maui manifest.microsoft-net-runtime-android]`.
