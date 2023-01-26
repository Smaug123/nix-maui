{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus/v1.3.1";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    utils,
    ...
  }:
    utils.lib.mkFlake {
      inherit self inputs;
      # for Android:
      # channelsConfig.android_sdk.accept_license = true;
      outputsBuilder = channels: let
        inherit (channels.nixpkgs) lib buildEnv dotnetCorePackages stdenvNoCC;
        # TODO - this 7.0.100 is hardcoded
        amendedSdkVersion = "7.0.100";
        platform =
          (
            if stdenvNoCC.isLinux
            then "linux"
            else if stdenvNoCC.isDarwin
            then "osx"
            else abort "unknown platform"
          )
          + "-"
          + (
            if stdenvNoCC.hostPlatform.parsed.cpu.family == "x86"
            then "x"
            else stdenvNoCC.hostPlatform.parsed.cpu.family
          )
          + builtins.toString stdenvNoCC.hostPlatform.parsed.cpu.bits;

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

        buildDotnetWorkload = fallback: input: let
          name = "f${input.pname}-${input.version}";
          # for workloads, there's a workloadName; for fallbacks, there's just the pname
          workloadName = input.workloadName or input.pname;
          sdkVersion = dotnetCorePackages.sdk_7_0.version;
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
                workload_out="$out/sdk-manifests/${amendedSdkVersion}/${lib.toLower (input.nugetName or input.pname)}"
                mkdir -p "$workload_out"
                chmod -R ugo+r data # Work around some nupkgs having no permissions set
                cp -R data/* "$workload_out"
              ''
              + lib.optionalString (!fallback && !builtins.isNull workloadName) ''
                installed_workloads_out="$out/metadata/workloads/${amendedSdkVersion}/InstalledWorkloads"
                mkdir -p "$installed_workloads_out"
                touch "$installed_workloads_out/${workloadName}"
              '';
          };
        in
          buildEnv {
            name = name;
            paths = nixpkgs.lib.lists.filter (x: !(builtins.isNull x)) (nixpkgs.lib.lists.map (pack:
              if nixpkgs.lib.hasAttr "pname" pack
              then pack
              # TODO there is surely an idiom for this
              else nixpkgs.lib.attrsets.attrByPath [platform] (nixpkgs.lib.attrsets.attrByPath ["any"] null pack) pack) (input.workloadPacks or [])
            ++ [workload]);
            pathsToLink = ["/metadata" "/library-packs" "/packs" "/template-packs" "/sdk-manifests" "/tool-packs"];
          };

        allManifests = import ./workload-manifest-list.nix fetchNuGet;

        composeDotnetWorkload = workloads: let
          builtWorkloads =
            nixpkgs.lib.lists.map (buildDotnetWorkload false) workloads;
          name = nixpkgs.lib.concatStrings builtWorkloads;
          fallbackWorkloads =
            builtins.filter (fallback: nixpkgs.lib.lists.all (desired: desired.src != fallback.src) workloads) allManifests;
        in
          buildEnv {
            name = "workload-${name}-combined";
            paths =
              builtWorkloads ++ nixpkgs.lib.lists.map (buildDotnetWorkload true) fallbackWorkloads;
          };

        buildDotnetPack = {
          name ? "${pname}-${version}",
          pname,
          version,
          originalKey ? pname,
          src,
          kind,
          dotnet_sdk ? dotnetCorePackages.sdk_7_0,
        }: let
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
            Path =
              builtins.placeholder "out"
              + (
                if kind == "template"
                then "/template-packs/${pname}/${version}/${pname}.nupkg"
                else if kind == "library"
                then "/library-packs/${pname}.${version}.nupkg"
                else "/packs/${pname}/${version}"
              );
            IsStillPacked = kind != "template";
          };
        in
          channels.nixpkgs.stdenvNoCC.mkDerivation {
            inherit pname version src;

            sourceRoot = "${pname}-${version}";

            nativeBuildInputs = [channels.nixpkgs.unzip channels.nixpkgs.yq];

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
                  # Some package contents have no read access?!
                  chmod a+r -R "$f"
                  ls -la "$f"
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
                metadata_out="$out/metadata/workloads/InstalledPacks/v1/${originalKey}/${version}"
                mkdir -p "$metadata_out"
                echo '${builtins.toJSON manifest}' > "$metadata_out/${amendedSdkVersion}"
                # Copy signature
                ${
                  if kind != "template"
                  then ''cp .signature.p7s "$nupkg_out"''
                  else ""
                }
              '';
          };
      in {
        devShell = let
          inherit (channels.nixpkgs) lib mkShell stdenv dotnetCorePackages jdk11 androidenv;

          manifest = import ./workload-manifest-contents.nix {inherit buildDotnetPack buildDotnetWorkload fetchNuGet;};
          workload = composeDotnetWorkload [manifest.maui-7_0_58 manifest.android-33_0_26 manifest.ios-16_2_1007 manifest.maccatalyst-16_2_1007 manifest.microsoft-net-runtime-maccatalyst-7_0_2];

          dotnet_sdk = dotnetCorePackages.sdk_7_0.overrideAttrs (old: let
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
                rm "$out/bin/dotnet"
                rm -r "$out/sdk-manifests"
                cp -r "${workload}/sdk-manifests" "$out/sdk-manifests"
                cp -r "${workload}/metadata" "$out/metadata"
                cp -r "${workload}/template-packs" "$out/template-packs"
                rm -r "$out/packs"
                cp -r "${workload}/packs" "$out"
                makeBinaryWrapper "$out/dotnet" "$out/bin/dotnet" \
                  --set DOTNETSDK_WORKLOAD_PACK_ROOTS "${workload}" \
                  --set DOTNETSDK_WORKLOAD_MANIFEST_ROOTS "${workload}/sdk-manifests" \
                  --set DYLD_FALLBACK_LIBRARY_PATH "${rpath}" \
                  --set DOTNET_CLI_WORKLOAD_UPDATE_NOTIFY_DISABLE "true"
              '';
            sandboxProfile = ''(allow file-read* (literal "/usr/share/icu/icudt70l.dat"))'';
          });
          # for Android:
          # android = androidenv.composeAndroidPackages {
          #               toolsVersion = "26.1.1";
          #               platformToolsVersion = "30.0.5";
          #               buildToolsVersions = [ "30.0.3" ];
          #               includeEmulator = false;
          #               emulatorVersion = "30.3.4";
          #               platformVersions = [ "28" "29" "30" ];
          #               includeSources = false;
          #               includeSystemImages = false;
          #               systemImageTypes = [ "google_apis_playstore" ];
          #               abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
          #               cmakeVersions = [ "3.10.2" ];
          #               includeNDK = true;
          #               ndkVersions = ["22.0.7026061"];
          #               useGoogleAPIs = false;
          #               useGoogleTVAddOns = false;
          #               includeExtras = [
          #                 "extras;google;gcm"
          #               ];
          #             };
          # then use jdk11 and android.androidsdk in the packages
        in
          mkShell {
            packages = [dotnet_sdk];
            DOTNET_ROOT = "${dotnet_sdk}";
            DOTNET_CLI_TELEMETRY_OPTOUT = "1";
          };
      };
    };
}
