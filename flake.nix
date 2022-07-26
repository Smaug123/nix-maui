{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    nixpkgs-21_11.url = "github:nixos/nixpkgs/nixos-21.11";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus/v1.3.1";
  };

  outputs = inputs@{ self, nixpkgs, utils, ... }:
    utils.lib.mkFlake {
      inherit self inputs;
      channelsConfig.allowBroken = true;
      outputsBuilder = channels:
        let
          inherit (channels.nixpkgs) lib buildEnv dotnetCorePackages;

          withWorkload = dotnet: workloads:
            channels.nixpkgs.callPackage (import ./combine-packages.nix dotnet workloads) {};

          fetchNuGet = { pname, version, hash }: channels.nixpkgs.fetchurl {
            name = "nuget-${pname}-${version}.nupkg";
            url = "https://www.nuget.org/api/v2/package/${pname}/${version}";
            inherit hash;
          };

          buildDotnetWorkload = f:
            let
              input = f sdkVersion;
              name = "f${input.pname}-${input.version}";
              workloadName = input.workloadName or null;
              sdkVersion = dotnetCorePackages.sdk_6_0.version;
              workload = channels.nixpkgs.stdenvNoCC.mkDerivation {
                inherit (input) pname version src;

                sourceRoot = "${name}";

                nativeBuildInputs = [ channels.nixpkgs.unzip ];

                preUnpack = ''mkdir "$sourceRoot"'';
                unpackCmd = ''unzip -qq $curSrc -d "$sourceRoot"'';

                dontConfigure = true;
                dontBuild = true;

                installPhase = ''
                  workload_out="$out/sdk-manifests/${sdkVersion}/${lib.toLower input.pname}"
                  mkdir -p "$workload_out"
                  chmod -R ugo+r data # Work around some nupkgs having no permissions set
                  cp -R data/* "$workload_out"
                '' + lib.optionalString (!builtins.isNull workloadName) ''
                  installed_workloads_out="$out/metadata/workloads/${sdkVersion}/InstalledWorkloads"
                  mkdir -p "$installed_workloads_out"
                  touch "$installed_workloads_out/${workloadName}"
                '';
              };
            in
            buildEnv {
              name = "workload-${name}-combined";
              paths = (input.workloadPacks or [ ]) ++ [ workload ];
              pathsToLink = [ "/metadata" "/library-packs" "/packs" "/template-packs" "/sdk-manifests" "/tool-packs" ];
            };

          buildDotnetPack = { name ? "${pname}-${version}", pname, version, src, kind, dotnet_sdk ? dotnetCorePackages.sdk_6_0 }:
            let
              kindMapping = {
                "framework" = 1;
                "sdk" = 0;
                "template" = 3;
                "library" = 2;
              };
              manifest = {
                Id = pname;
                Version = version;
                Kind = kindMapping."${kind}";
                ResolvedPackageId = pname;
                Path = builtins.placeholder "out" + (if kind == "template"
                  then "/template-packs/${pname}/${version}/${pname}.nupkg"
                  else if kind == "library"
                  then "/library-packs/${pname}.${version}.nupkg"
                  else "/packs/${pname}/${version}");
                IsStillPacked = kind != "template";
              };
            in
            channels.nixpkgs.stdenvNoCC.mkDerivation {
              inherit pname version src;

              sourceRoot = "${pname}-${version}";

              nativeBuildInputs = [ channels.nixpkgs.unzip channels.nixpkgs-21_11.yq ];

              preUnpack = ''mkdir "$sourceRoot"'';
              unpackCmd = ''unzip -qq $curSrc -d "$sourceRoot"'';

              dontConfigure = true;
              dontBuild = true;

              meta.priority = -1;
              installPhase = lib.optionalString (kind != "template") ''
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
              '' + ''
                nupkg_out="$out/${if kind == "template" then "template-packs" else "packs/${pname}/${version}"}"
                nupkg_name="${if kind == "template" then (lib.toLower "${pname}.${version}") else pname}"
                mkdir -p "$nupkg_out"
                cp "$src" "$nupkg_out/$nupkg_name.nupkg"
                # Register metadata
                metadata_out="$out/metadata/workloads/InstalledPacks/v1/${pname}/${version}"
                mkdir -p "$metadata_out"
                echo '${builtins.toJSON manifest}' > "$metadata_out/${dotnet_sdk.version}"
                # Copy signature
                ${if kind != "template" then ''cp .signature.p7s "$nupkg_out"'' else ""}
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

maui = buildDotnetWorkload (sdkVersion: rec {
  pname = "maui";
  version = "6.0.419";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maui.manifest-6.0.300";
    inherit version;
    hash = "sha256-x84cTUrys135LGizbGMlbe9lA0/MS7bmZ5Agz4T9ooU=";
  };
  workloadName = "maui";
  workloadPacks = [
    MicrosoftMauiTemplates-60
    MicrosoftMauiSdk
    MicrosoftMauiResizetizerSdk
    MicrosoftMauiGraphicsWin2DWinUIDesktop
    MicrosoftMauiGraphics
    MicrosoftMauiExtensions
    MicrosoftMauiEssentialsRuntimewin
    MicrosoftMauiEssentialsRuntimetizen
    MicrosoftMauiEssentialsRuntimemaccatalyst
    MicrosoftMauiEssentialsRuntimeios
    MicrosoftMauiEssentialsRuntimeany
    MicrosoftMauiEssentialsRuntimeandroid
    MicrosoftMauiEssentialsRefwin
    MicrosoftMauiEssentialsReftizen
    MicrosoftMauiEssentialsRefmaccatalyst
    MicrosoftMauiEssentialsRefios
    MicrosoftMauiEssentialsRefany
    MicrosoftMauiEssentialsRefandroid
    MicrosoftMauiDependencies
    MicrosoftMauiCoreRuntimewin
    MicrosoftMauiCoreRuntimetizen
    MicrosoftMauiCoreRuntimemaccatalyst
    MicrosoftMauiCoreRuntimeios
    MicrosoftMauiCoreRuntimeany
    MicrosoftMauiCoreRuntimeandroid
    MicrosoftMauiCoreRefwin
    MicrosoftMauiCoreReftizen
    MicrosoftMauiCoreRefmaccatalyst
    MicrosoftMauiCoreRefios
    MicrosoftMauiCoreRefany
    MicrosoftMauiCoreRefandroid
    MicrosoftMauiControlsRuntimewin
    MicrosoftMauiControlsRuntimetizen
    MicrosoftMauiControlsRuntimemaccatalyst
    MicrosoftMauiControlsRuntimeios
    MicrosoftMauiControlsRuntimeany
    MicrosoftMauiControlsRuntimeandroid
    MicrosoftMauiControlsRefwin
    MicrosoftMauiControlsReftizen
    MicrosoftMauiControlsRefmaccatalyst
    MicrosoftMauiControlsRefios
    MicrosoftMauiControlsRefany
    MicrosoftMauiControlsRefandroid
    MicrosoftAspNetCoreComponentsWebViewMaui
  ];
});
MicrosoftMauiTemplates-60 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Templates-6.0";
  version = "6.0.419";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-feO/X1v/q9rszh9/foPush2fTQQh+w4tPx/h36RSPnE=";
  };
};
MicrosoftMauiSdk = buildDotnetPack rec {
  pname = "Microsoft.Maui.Sdk";
  version = "6.0.419";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-zhkKx3FSL9tZBDeSu4drXZH1IV4OM2iMONv6Fk7dRBg=";
  };
};
MicrosoftMauiResizetizerSdk = buildDotnetPack rec {
  pname = "Microsoft.Maui.Resizetizer.Sdk";
  version = "6.0.419";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-lZymNE00MlOETFmduMigzsFAmZnTTzrXQlxpAjhY+7g=";
  };
};
MicrosoftMauiGraphicsWin2DWinUIDesktop = buildDotnetPack rec {
  pname = "Microsoft.Maui.Graphics.Win2D.WinUI.Desktop";
  version = "6.0.403";
  kind = "library";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-l5PY3nyW63W+0Ye+mawLB7TOZURiybI6wApCglBP4fg=";
  };
};
MicrosoftMauiGraphics = buildDotnetPack rec {
  pname = "Microsoft.Maui.Graphics";
  version = "6.0.403";
  kind = "library";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-0mNUTjmN/sq0kEBDVVTDn6sjELqfLkym6X5wMim2uqk=";
  };
};
MicrosoftMauiExtensions = buildDotnetPack rec {
  pname = "Microsoft.Maui.Extensions";
  version = "6.0.419";
  kind = "library";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-fPn1SVxxUPAGBEe1e7XAsehQRcv/u3K8uTpHMh0fcHY=";
  };
};
MicrosoftMauiEssentialsRuntimewin = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.win";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-5Su9xaVDO8138f5aLcnPrr5riaY5FwDH/RJ3Yoa6G2c=";
  };
};
MicrosoftMauiEssentialsRuntimetizen = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.tizen";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-xloZcGAmqFnVDQlSbw6IHB5fJktR0Xj5kcbNpA1Rmls=";
  };
};
MicrosoftMauiEssentialsRuntimemaccatalyst = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.maccatalyst";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-/G/2c3A4sBT1RPFcMqoiw5D3VoFYsXD7Cs8C5VHdOfQ=";
  };
};
MicrosoftMauiEssentialsRuntimeios = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.ios";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-XIiDpRpAgEfPHFjYoZTprx3Sr1CCN0FwSVs9MkvIFLY=";
  };
};
MicrosoftMauiEssentialsRuntimeany = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.any";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-fEbd/VnWFMsCWXEg8ryK4mRzb5Cs7xJCq3bAZCUkeXo=";
  };
};
MicrosoftMauiEssentialsRuntimeandroid = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.android";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-z0BGue8EDLA/m5Lr0TjiM5RBM4Qht9RPgS+mXDZRd5o=";
  };
};
MicrosoftMauiEssentialsRefwin = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.win";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-T4HTdg8Y1c7PSaEdCE1dh55ulNeSlV3VzjO+xZvpmtg=";
  };
};
MicrosoftMauiEssentialsReftizen = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.tizen";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-LUdauad4VsKLq3ucwmwunmTbuATFAjeZYbELy9oSMsk=";
  };
};
MicrosoftMauiEssentialsRefmaccatalyst = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.maccatalyst";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-EYSoF9Y5w3c3ID7t8IJa95f9SVL5pZTk+AVDhPl5Fsk=";
  };
};
MicrosoftMauiEssentialsRefios = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.ios";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-+SE4Etpw9MSNnhN6vVnNsRJnGr5QizyqpnwXVlnLk2c=";
  };
};
MicrosoftMauiEssentialsRefany = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.any";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-8VU1KK3V6L+iLOR2I4RE7RE90WyOD8Frsybv32iBRh4=";
  };
};
MicrosoftMauiEssentialsRefandroid = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.android";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-2pDX2OYJoGyxQUcXkPTU1m7RiJtYm8CueaFzAQNXi2w=";
  };
};
MicrosoftMauiDependencies = buildDotnetPack rec {
  pname = "Microsoft.Maui.Dependencies";
  version = "6.0.419";
  kind = "library";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-ht9aNSImFiK5hfo4I+UPi9TPWVQ7Lmp/nUGcqsni2xk=";
  };
};
MicrosoftMauiCoreRuntimewin = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.win";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-xcOyrJ8+auEvR1CZUdGCu6v5evnIcBgrLnuXPSY7S30=";
  };
};
MicrosoftMauiCoreRuntimetizen = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.tizen";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-nVNbUw/t7EuUNfCApB0/wdukVbTQlm1KEkf+yo0s5N4=";
  };
};
MicrosoftMauiCoreRuntimemaccatalyst = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.maccatalyst";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-7v7g0Sbzob8xQZb/Y2wJfotZzG9fB4n2bdJ/oK5Er+0=";
  };
};
MicrosoftMauiCoreRuntimeios = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.ios";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-b4lhznnMp1O8Ly/Dc39u6WpcOhjU+GKUUZfGE37BXgc=";
  };
};
MicrosoftMauiCoreRuntimeany = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.any";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-oYMhaUVmyUbqTll3Z1ABKg3THak/vuosHZqfCs31dSQ=";
  };
};
MicrosoftMauiCoreRuntimeandroid = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.android";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Q4fuX6VvTANANnaisGvBgPH8QqbWDqnzXHy7RpUe/pU=";
  };
};
MicrosoftMauiCoreRefwin = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.win";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Pj6zqzIxctjh0fcCJXPJuZuhC/I6oNnPl6Irnxwc9ew=";
  };
};
MicrosoftMauiCoreReftizen = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.tizen";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-FWAs1sFfCCc/S5oKqRqyCkNB1/Qng2Km/UoYb6G3lj0=";
  };
};
MicrosoftMauiCoreRefmaccatalyst = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.maccatalyst";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-//EOe7NsTCBW4gwI8gV/IWHGyHY4vYp04i34N3zJQmc=";
  };
};
MicrosoftMauiCoreRefios = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.ios";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-qSEHbNyCV43bmv1ll6XpqdqL2kGpDx10BPX/Vx6OhJk=";
  };
};
MicrosoftMauiCoreRefany = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.any";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-XdQsKI5/huB1vY50eMxe0BQrM0bqe52E/b8FqWp4WvY=";
  };
};
MicrosoftMauiCoreRefandroid = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.android";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-5kz+y3Yko5oATuzLwuBtDYMk+rg/Ng9ij1sIlYh2N08=";
  };
};
MicrosoftMauiControlsRuntimewin = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.win";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-jh/CfuX3hSJT3gOjvC8rPx2tPjtHJP9cODjBBPM8ZZQ=";
  };
};
MicrosoftMauiControlsRuntimetizen = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.tizen";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-M6EGHm+IvVi5PAJ7dLEpaYvMdViHfqc8FGM/Gcn/O+c=";
  };
};
MicrosoftMauiControlsRuntimemaccatalyst = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.maccatalyst";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-X3upqfxgxl/o9VyUlyBaWrkUVOR0dvOBzmocwowMSlw=";
  };
};
MicrosoftMauiControlsRuntimeios = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.ios";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-QoaHjWjyfrWWcfOzjLXb+b2d9IyBm3/hfjgqaH/9rwo=";
  };
};
MicrosoftMauiControlsRuntimeany = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.any";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-yA4rgGNuNvHBEwNaetToWgR4/2O4sUIh8EmsV24uup4=";
  };
};
MicrosoftMauiControlsRuntimeandroid = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.android";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-2jVYI0McarnYDjQgtloeuCzQf++9c529NBrxRtYExSA=";
  };
};
MicrosoftMauiControlsRefwin = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.win";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-FKkNs9RP/WRP+zKZrasnJWqAdEwuqJPumCWJ4ZdAVxQ=";
  };
};
MicrosoftMauiControlsReftizen = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.tizen";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Lnhc812OgiZOsodxlGfpek1CiwXbezCBgcOztdobn5E=";
  };
};
MicrosoftMauiControlsRefmaccatalyst = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.maccatalyst";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-1LX50BxsShn9KlagaWxcmEleUfsiDDY8gN33P3OLJm0=";
  };
};
MicrosoftMauiControlsRefios = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.ios";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-5LD9hGhZxDYU/BKyKShGJ04j8x4Hdr76K3JkwnZVY7A=";
  };
};
MicrosoftMauiControlsRefany = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.any";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-WtVYlKEUwOlzcKccrYbhfjbO10n5KsdzuaqVtc18oJk=";
  };
};
MicrosoftMauiControlsRefandroid = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.android";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-D9s+3rRUH1IBSqTuh32drI3kD1YlWkBG7f/4ouvi+gM=";
  };
};
MicrosoftAspNetCoreComponentsWebViewMaui = buildDotnetPack rec {
  pname = "Microsoft.AspNetCore.Components.WebView.Maui";
  version = "6.0.419";
  kind = "library";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-kUJk8jm722TV9f9MsJRQfTUyDeh/mwsszNiuaTPKk+w=";
  };
};

        in
        {
          devShell =
            let
              inherit (channels.nixpkgs) lib mkShell stdenv dotnetCorePackages;

              macosWorkload = maui;

              dotnet_sdk = dotnetCorePackages.sdk_6_0.overrideAttrs (old:
                let
                  major = lib.versions.major old.version;
                  minor = lib.versions.minor old.version;
                  patch = lib.versions.patch old.version;
                  featureBand = "${major}.${minor}.${builtins.substring 0 1 patch}00";
                  rpath = with channels.nixpkgs; lib.makeLibraryPath [
                        stdenv.cc.cc
                        zlib
                        curl
                        icu
                        libunwind
                        libuuid
                        openssl
                  ];
                in {
                  nativeBuildInputs = old.nativeBuildInputs or [ ] ++ [ channels.nixpkgs.makeBinaryWrapper ];
                  postFixup = old.postFixup + ''
                    rm "$out/bin/dotnet"
                    cp -r ${macosWorkload}/sdk-manifests/${dotnetCorePackages.sdk_6_0.version}/* "$out/sdk-manifests"
                    rm -r "$out/sdk-manifests/6.0.300/microsoft.net.sdk.maui"
                    cp -r "${macosWorkload}/metadata" "$out/metadata"
                    cp -r "${macosWorkload}/template-packs" "$out/template-packs"
                    cp -r "${macosWorkload}/tool-packs" "$out/tool-packs"
                    makeBinaryWrapper "$out/dotnet" "$out/bin/dotnet" \
                      --set DOTNETSDK_WORKLOAD_PACK_ROOTS "${macosWorkload}" \
                      --set DOTNETSDK_WORKLOAD_MANIFEST_ROOTS "${macosWorkload}/sdk-manifests" \
                      --set DYLD_FALLBACK_LIBRARY_PATH "${rpath}" \
                      --set DOTNET_CLI_WORKLOAD_UPDATE_NOTIFY_DISABLE "true"
                  '';
                  sandboxProfile = ''(allow file-read* (literal "/usr/share/icu/icudt70l.dat"))'';
                });
            in
            mkShell {
              packages = [ dotnet_sdk ];
              DOTNET_ROOT = "${dotnet_sdk}";
              DOTNET_CLI_TELEMETRY_OPTOUT="1";
            };
      };
  };
}
