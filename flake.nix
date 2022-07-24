{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/49546f4413ff5a7b4c46b9c56f0ef9cc8a106449";
    nixpkgs-21_11.url = "github:nixos/nixpkgs/nixos-21.11";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus/v1.3.1";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    utils,
    ...
  }:
    let pkgs = self.pkgs.aarch64-darwin.nixpkgs; in
    utils.lib.mkFlake {
      inherit self inputs;
      supportedSystems = ["aarch64-darwin"];
      channelsConfig.allowBroken = true;
      outputsBuilder = channels: let
        inherit (channels.nixpkgs) lib buildEnv dotnetCorePackages;

        withWorkload = dotnet: workloads:
          channels.nixpkgs.callPackage (import ./combine-packages.nix dotnet workloads) {};

        fetchNuGet = {
          pname,
          version,
          hash,
        }:
          channels.nixpkgs.fetchurl {
            name = "nuget-${pname}-${version}.nupkg";
            url = "https://www.nuget.org/api/v2/package/${pname}/${version}";
            inherit hash;
          };

        buildDotnetWorkload = f: let
          input = f sdkVersion;
          name = "f${input.pname}-${input.version}";
          workloadName = input.workloadName or null;
          sdkVersion = "6.0.300"; # dotnetCorePackages.sdk_6_0.version;
          workload = channels.nixpkgs.stdenvNoCC.mkDerivation {
            inherit (input) pname version src;

            sourceRoot = "${name}";

            nativeBuildInputs = [channels.nixpkgs.unzip];

            preUnpack = ''mkdir "$sourceRoot"'';
            unpackCmd = ''unzip -qq $curSrc -d "$sourceRoot"'';

            dontConfigure = true;
            dontBuild = true;

            installPhase =
              ''
                workload_out="$out/sdk-manifests/${sdkVersion}/${lib.toLower input.pname}"
                mkdir -p "$workload_out"
                chmod -R ugo+r data # Work around some nupkgs having no permissios set
                cp -R data/* "$workload_out"
              ''
              + lib.optionalString (!builtins.isNull workloadName) ''
                installed_workloads_out="$out/metadata/workloads/${sdkVersion}/InstalledWorkloads"
                mkdir -p "$installed_workloads_out"
                touch "$installed_workloads_out/${workloadName}"
              '';
          };
        in
          buildEnv {
            name = "workload-${name}-combined";
            paths = (input.workloadPacks or []) ++ [workload];
            pathsToLink = ["/metadata" "/library-packs" "/packs" "/template-packs" "/sdk-manifests" "/tool-packs"];
          };

        buildDotnetPack = {
          name ? "${pname}-${version}",
          pname,
          version,
          src,
          kind,
          dotnet_sdk ? dotnetCorePackages.sdk_6_0,
        }: let
          kindMapping = {
            "framework" = 1;
            "sdk" = 0;
            "template" = 3;
          };
          manifest = {
            Id = pname;
            Version = version;
            Kind = kindMapping."${kind}";
            ResolvedPackageId = pname;
            Path =
              builtins.placeholder "out"
              + (
                if kind == "template"
                then "/template-packs/${pname}/${version}/${pname}.nupkg"
                else "/packs/${pname}/${version}"
              );
            IsStillPacked = kind != "template";
          };
        in
          channels.nixpkgs.stdenvNoCC.mkDerivation {
            inherit pname version src;

            sourceRoot = "${pname}-${version}";

            nativeBuildInputs = [channels.nixpkgs.unzip channels.nixpkgs-21_11.yq];

            preUnpack = ''mkdir "$sourceRoot"'';
            unpackCmd = ''unzip -qq $curSrc -d "$sourceRoot"'';

            dontConfigure = true;
            dontBuild = true;

            meta.priority = -1;
            installPhase =
              lib.optionalString (kind != "template") ''
                workload_out="$out/packs/${pname}/${version}"
                mkdir -p "$workload_out"

                # Install workload files
                for f in $(ls -1 | grep -vE '\[Content_Types\].xml|_rels|package'); do
                  cp -R "$f" "$workload_out"
                done

                # Set file permissions (e.g., for shell scripts)
                if [ -f data/UnixFilePermissions.xml ]; then
                  declare -A perms="($(xq -r '.FileList.File | .[] | @sh "[\(."@Path")]=\(."@Permission")"' data/UnixFilePermissions.xml))"
                  for file in "''${!perms[@]}"; do
                    chmod "''${perms[$file]}" "$workload_out/$file"
                  done
                fi

              ''
              + ''
                nupkg_out="$out/${
                  if kind == "template"
                  then "template-packs"
                  else "packs/${pname}/${version}"
                }"
                nupkg_name="${
                  if kind == "template"
                  then (lib.toLower "${pname}.${version}")
                  else pname
                }"
                mkdir -p "$nupkg_out"
                cp "$src" "$nupkg_out/$nupkg_name.nupkg"

                # Register metadata
                metadata_out="$out/metadata/workloads/InstalledPacks/v1/${pname}/${version}"
                mkdir -p "$metadata_out"
                echo '${builtins.toJSON manifest}' > "$metadata_out/${dotnet_sdk.version}"

                # Copy signature
                ${
                  if kind != "template"
                  then ''cp .signature.p7s "$nupkg_out"''
                  else ""
                }
              '';
          };

        Microsoft.NET.Sdk.macOS = buildDotnetWorkload (sdkVersion: rec {
          pname = "Microsoft.NET.Sdk.macOS";
          version = "12.3.303";
          src = fetchNuGet {
            pname = "${pname}.Manifest-${sdkVersion}";
            inherit version;
            hash = "sha256-sz9Qal+YTwj5EL/+KXH0GQs5v+uPFDXbGN1uVwyN0uI=";
          };
          workloadName = "macos";
          workloadPacks = [
            Microsoft.macOS.Ref
            Microsoft.macOS.Runtime.osx-arm64
            Microsoft.macOS.Runtime.osx-x64
            Microsoft.macOS.Sdk
            Microsoft.macOS.Templates
            Microsoft.NET.Workload.Mono.ToolChain
          ];
        });

        Microsoft.NET.Sdk.iOS = buildDotnetWorkload (sdkVersion: rec {
          pname = "Microsoft.NET.Sdk.macOS";
          version = "12.3.303";
          src = fetchNuGet {
            pname = "${pname}.Manifest-${sdkVersion}";
            inherit version;
            hash = "sha256-sz9Qal+YTwj5EL/+KXH0GQs5v+uPFDXbGN1uVwyN0uI=";
          };
          workloadName = "macos";
          workloadPacks = [
            Microsoft.iOS.Sdk
            # Microsoft.iOS.Windows.Sdk.Aliased
            Microsoft.iOS.Ref
            Microsoft.iOS.Runtime.ios-arm
            Microsoft.iOS.Runtime.ios-arm64
            Microsoft.iOS.Runtime.iossimulator-x86
            Microsoft.iOS.Runtime.iossimulator-x64
            Microsoft.iOS.Runtime.iossimulator-arm64
            Microsoft.iOS.Templates
            Microsoft.NET.Workload.Mono.ToolChain
            Microsoft.NETCore.App.Runtime.AOT.Cross.ios-arm
            Microsoft.NETCore.App.Runtime.AOT.Cross.ios-arm64
            Microsoft.NETCore.App.Runtime.AOT.Cross.iossimulator-arm64
            Microsoft.NETCore.App.Runtime.AOT.Cross.iossimulator-x64
            Microsoft.NETCore.App.Runtime.AOT.Cross.iossimulator-x86
            Microsoft.NETCore.App.Runtime.Mono.ios-arm
            Microsoft.NETCore.App.Runtime.Mono.ios-arm64
            Microsoft.NETCore.App.Runtime.Mono.iossimulator-arm64
            Microsoft.NETCore.App.Runtime.Mono.iossimulator-x64
            Microsoft.NETCore.App.Runtime.Mono.iossimulator-x86
            Microsoft.NET.Runtime.MonoAOTCompiler.Task
            Microsoft.NET.Runtime.MonoTargets.Sdk
          ];
        });

        Microsoft.NET.Workload.Mono.ToolChain = buildDotnetWorkload (sdkVersion: rec {
          pname = "Microsoft.NET.Workload.Mono.ToolChain";
          version = "6.0.5";
          src = fetchNuGet {
            pname = "${pname}.Manifest-${sdkVersion}";
            inherit version;
            hash = "sha256-kGezwbecN5JB5DC+r7oUhR19incuAuA6nO75DmRJhhc=";
          };
          workloadPacks = [
            Microsoft.NET.Runtime.MonoAOTCompiler.Task
            Microsoft.NET.Runtime.MonoTargets.Sdk
          ];
        });

        Microsoft.macOS.Sdk = buildDotnetPack rec {
          pname = "Microsoft.macOS.Sdk";
          version = "12.3.303";
          kind = "sdk";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-wsRMM+3wKZmmcNJ1ZXJRBOMBzBoYO41Uf8wAdyM9dF8=";
          };
        };

        Microsoft.iOS.Sdk = buildDotnetPack rec {
          pname = "Microsoft.iOS.Sdk";
          version = "15.4.311";
          kind = "sdk";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-wsRMM+3wKZmmcNJ1ZXJRBOMBzBoYO41Uf8wAdyM9dF8=";
          };
        };

        Microsoft.macOS.Ref = buildDotnetPack rec {
          pname = "Microsoft.macOS.Ref";
          version = "12.3.303";
          kind = "framework";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-9/6qvmzrnJ93Y3O/7a25DFja1q1WuxxPegaoEEYW1JI=";
          };
        };

        Microsoft.macOS.Runtime.osx-arm64 = buildDotnetPack rec {
          pname = "Microsoft.macOS.Runtime.osx-arm64";
          version = "12.3.303";
          kind = "framework";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-cx+G4+64eGzQ2Pvdzew+nbkhmRoz1ozuTjw/DTcHcZs=";
          };
        };

        Microsoft.macOS.Runtime.osx-x64 = buildDotnetPack rec {
          pname = "Microsoft.macOS.Runtime.osx-x64";
          version = "12.3.303";
          kind = "framework";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-8unEHwTUVIf6cKg0UrmZEoi2VOXfkkh/du3hYqjiing=";
          };
        };

        Microsoft.macOS.Templates = buildDotnetPack rec {
          pname = "Microsoft.macOS.Templates";
          version = "12.3.303";
          kind = "template";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-UUyovSzl/lS4WUI+4yIZy7BxhqV9fpdxZXFfHlP7pK4=";
          };
        };

        Microsoft.NET.Runtime.MonoAOTCompiler.Task = buildDotnetPack rec {
          pname = "Microsoft.NET.Runtime.MonoAOTCompiler.Task";
          version = "6.0.5";
          kind = "sdk";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-y2QQeOuLs22dY03H8aDSB0qZGqzYlaS/mFoMY2585Kw=";
          };
        };

        Microsoft.NET.Runtime.MonoTargets.Sdk = buildDotnetPack rec {
          pname = "Microsoft.NET.Runtime.MonoTargets.Sdk";
          version = "6.0.5";
          kind = "sdk";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-Vv8oF8LZ5NNAPNSO2ZCw3jTCPu0fbPS3s/0irtMLU6Y=";
          };
        };

        # "Microsoft.iOS.Windows.Sdk.Aliased",
        "Microsoft.iOS.Ref" = buildDotnetPack rec {
          pname = "Microsoft.iOS.Ref";
          version = "15.4.311";
          kind = "framework";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-UUyovSzl/lS4WUI+4yIZy7BxhqV9fpdxZXFfHlP7pK4=";
          };
        };

        Microsoft.iOS.Runtime.ios-arm = buildDotnetPack rec {
          pname = "Microsoft.iOS.Runtime.ios-arm";
          version = "15.4.311";
          kind = "framework";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-UUyovSzl/lS4WUI+4yIZy7BxhqV9fpdxZXFfHlP7pK4=";
          };
        };
        Microsoft.iOS.Runtime.ios-arm64 = buildDotnetPack rec {
          pname = "Microsoft.iOS.Runtime.ios-arm64";
          version = "15.4.311";
          kind = "framework";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-UUyovSzl/lS4WUI+4yIZy7BxhqV9fpdxZXFfHlP7pK4=";
          };
        };
        Microsoft.iOS.Runtime.iossimulator-x86 = buildDotnetPack rec {
          pname = "Microsoft.iOS.Runtime.iossimulator-x86";
          version = "15.4.311";
          kind = "framework";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-UUyovSzl/lS4WUI+4yIZy7BxhqV9fpdxZXFfHlP7pK4=";
          };
        };
        Microsoft.iOS.Runtime.iossimulator-x64 = buildDotnetPack rec {
          pname = "Microsoft.iOS.Runtime.iossimulator-x64";
          version = "15.4.311";
          kind = "framework";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-UUyovSzl/lS4WUI+4yIZy7BxhqV9fpdxZXFfHlP7pK4=";
          };
        };
        Microsoft.iOS.Runtime.iossimulator-arm64 = buildDotnetPack rec {
          pname = "Microsoft.iOS.Runtime.iossimulator-arm64";
          version = "15.4.311";
          kind = "framework";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-UUyovSzl/lS4WUI+4yIZy7BxhqV9fpdxZXFfHlP7pK4=";
          };
        };
        Microsoft.iOS.Template = buildDotnetPack rec {
          pname = "Microsoft.iOS.Template";
          version = "15.4.311";
          kind = "template";
          src = fetchNuGet {
            inherit pname version;
            hash = "sha256-UUyovSzl/lS4WUI+4yIZy7BxhqV9fpdxZXFfHlP7pK4=";
          };
        };
      in {
        devShell = let
          inherit (channels.nixpkgs) lib mkShell stdenv dotnetCorePackages;

          macosWorkload = Microsoft.NET.Sdk.macOS;

          dotnet_sdk = dotnetCorePackages.sdk_6_0.overrideAttrs (old: let
            major = lib.versions.major old.version;
            minor = lib.versions.minor old.version;
            patch = lib.versions.patch old.version;
            featureBand = "${major}.${minor}.${builtins.substring 0 1 patch}00";
            rpath = with channels.nixpkgs;
              lib.makeLibraryPath [
                stdenv.cc.cc
                zlib
                curl
                icu
                libunwind
                libuuid
                openssl
              ];
          in {
            nativeBuildInputs = old.nativeBuildInputs or [] ++ [channels.nixpkgs.makeBinaryWrapper];
            postFixup =
              old.postFixup
              + ''
              $out/bin/dotnet run maui-dotnet-flake.fsproj fooo
              '';
            sandboxProfile = ''(allow file-read* (literal "/usr/share/icu/icudt70l.dat"))'';
          });
        in
          mkShell {
            name = "devShell";
            packages = [dotnet_sdk];
            DOTNET_ROOT = "${dotnet_sdk}";
            DOTNET_CLI_TELEMETRY_OPTOUT = "1";
          };
      };
    };
}
