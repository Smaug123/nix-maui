{ buildDotnetWorkload, fetchNuGet, buildDotnetPack }: rec {
android = buildDotnetWorkload (sdkVersion: rec {
  pname = "android";
  version = "32.0.440";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.android.manifest-6.0.300";
    inherit version;
    hash = "sha256-IBcXur/I4Su+2PiVLuheS0sIxOAHSsS9XMW2knhYCE8=";
  };
  workloadName = "android";
  workloadPacks = [
    MicrosoftAndroidRef31
    MicrosoftAndroidRef32
    MicrosoftAndroidRef33
    MicrosoftAndroidRuntime32android-arm
    MicrosoftAndroidRuntime32android-arm64
    MicrosoftAndroidRuntime32android-x64
    MicrosoftAndroidRuntime32android-x86
    MicrosoftAndroidRuntime33android-arm
    MicrosoftAndroidRuntime33android-arm64
    MicrosoftAndroidRuntime33android-x64
    MicrosoftAndroidRuntime33android-x86
    MicrosoftAndroidTemplates
    MicrosoftAndroidSdk
  ];
});
ios = buildDotnetWorkload (sdkVersion: rec {
  pname = "ios";
  version = "15.4.328";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.ios.manifest-6.0.300";
    inherit version;
    hash = "sha256-BMtCkuBydIlnH5yohg6yKc6lqQ4jcvz9rpP7jLtO5G0=";
  };
  workloadName = "ios";
  workloadPacks = [
    MicrosoftiOSRef
    MicrosoftiOSRuntimeios-arm
    MicrosoftiOSRuntimeios-arm64
    MicrosoftiOSRuntimeiossimulator-arm64
    MicrosoftiOSRuntimeiossimulator-x64
    MicrosoftiOSRuntimeiossimulator-x86
    MicrosoftiOSSdk
    MicrosoftiOSTemplates
    MicrosoftiOSWindowsSdkAliased
  ];
});
maccatalyst = buildDotnetWorkload (sdkVersion: rec {
  pname = "maccatalyst";
  version = "15.4.328";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maccatalyst.manifest-6.0.300";
    inherit version;
    hash = "sha256-2G3fLcQKNq2v2aTN13ZNMWdhAfJ5Iv3m6dFzl4c0WqY=";
  };
  workloadName = "maccatalyst";
  workloadPacks = [
    MicrosoftMacCatalystRef
    MicrosoftMacCatalystRuntimemaccatalyst-arm64
    MicrosoftMacCatalystRuntimemaccatalyst-x64
    MicrosoftMacCatalystSdk
    MicrosoftMacCatalystTemplates
    
  ];
});
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
    MicrosoftAspNetCoreComponentsWebViewMaui
    MicrosoftMauiControlsRefandroid
    MicrosoftMauiControlsRefany
    MicrosoftMauiControlsRefios
    MicrosoftMauiControlsRefmaccatalyst
    MicrosoftMauiControlsReftizen
    MicrosoftMauiControlsRefwin
    MicrosoftMauiControlsRuntimeandroid
    MicrosoftMauiControlsRuntimeany
    MicrosoftMauiControlsRuntimeios
    MicrosoftMauiControlsRuntimemaccatalyst
    MicrosoftMauiControlsRuntimetizen
    MicrosoftMauiControlsRuntimewin
    MicrosoftMauiCoreRefandroid
    MicrosoftMauiCoreRefany
    MicrosoftMauiCoreRefios
    MicrosoftMauiCoreRefmaccatalyst
    MicrosoftMauiCoreReftizen
    MicrosoftMauiCoreRefwin
    MicrosoftMauiCoreRuntimeandroid
    MicrosoftMauiCoreRuntimeany
    MicrosoftMauiCoreRuntimeios
    MicrosoftMauiCoreRuntimemaccatalyst
    MicrosoftMauiCoreRuntimetizen
    MicrosoftMauiCoreRuntimewin
    MicrosoftMauiDependencies
    MicrosoftMauiEssentialsRefandroid
    MicrosoftMauiEssentialsRefany
    MicrosoftMauiEssentialsRefios
    MicrosoftMauiEssentialsRefmaccatalyst
    MicrosoftMauiEssentialsReftizen
    MicrosoftMauiEssentialsRefwin
    MicrosoftMauiEssentialsRuntimeandroid
    MicrosoftMauiEssentialsRuntimeany
    MicrosoftMauiEssentialsRuntimeios
    MicrosoftMauiEssentialsRuntimemaccatalyst
    MicrosoftMauiEssentialsRuntimetizen
    MicrosoftMauiEssentialsRuntimewin
    MicrosoftMauiExtensions
    MicrosoftMauiGraphics
    MicrosoftMauiGraphicsWin2DWinUIDesktop
    MicrosoftMauiResizetizerSdk
    MicrosoftMauiSdk
    MicrosoftMauiTemplates-60
    
  ];
});
microsoft-net-runtime-android = buildDotnetWorkload (sdkVersion: rec {
  pname = "microsoft-net-runtime-android";
  version = "6.0.7";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.manifest-6.0.300";
    inherit version;
    hash = "sha256-m2W3IZkG04wqVTcq2rauXO3e8hWYh7eHaPc1T99kBjY=";
  };
  workloadName = "microsoft-net-runtime-android";
  workloadPacks = [
    MicrosoftNETCoreAppRuntimeMonoandroid-arm
    MicrosoftNETCoreAppRuntimeMonoandroid-arm64
    MicrosoftNETCoreAppRuntimeMonoandroid-x64
    MicrosoftNETCoreAppRuntimeMonoandroid-x86
    MicrosoftNETCoreAppRuntimeMonobrowser-wasm
    MicrosoftNETCoreAppRuntimeMonoios-arm
    MicrosoftNETCoreAppRuntimeMonoios-arm64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-arm64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-x64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-x86
    MicrosoftNETCoreAppRuntimeMonomaccatalyst-arm64
    MicrosoftNETCoreAppRuntimeMonomaccatalyst-x64
    MicrosoftNETCoreAppRuntimeMonoosx-arm64
    MicrosoftNETCoreAppRuntimeMonoosx-x64
    MicrosoftNETCoreAppRuntimeMonotvos-arm64
    MicrosoftNETCoreAppRuntimeMonotvossimulator-arm64
    MicrosoftNETCoreAppRuntimeMonotvossimulator-x64
    MicrosoftNETCoreAppRuntimeosx-arm64
    MicrosoftNETCoreAppRuntimeosx-x64
    MicrosoftNETCoreAppRuntimewin-arm
    MicrosoftNETCoreAppRuntimewin-arm64
    MicrosoftNETCoreAppRuntimewin-x64
    MicrosoftNETCoreAppRuntimewin-x86
    MicrosoftNETRuntimeMonoAOTCompilerTask
    MicrosoftNETRuntimeMonoTargetsSdk
    MicrosoftNETRuntimeWebAssemblySdk
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-arm
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-x64
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-x86
    MicrosoftNETCoreAppRuntimeAOTCrossbrowser-wasm
    MicrosoftNETCoreAppRuntimeAOTCrossios-arm
    MicrosoftNETCoreAppRuntimeAOTCrossios-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-x64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-x86
    MicrosoftNETCoreAppRuntimeAOTCrossmaccatalyst-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossmaccatalyst-x64
    MicrosoftNETCoreAppRuntimeAOTCrosstvos-arm64
    MicrosoftNETCoreAppRuntimeAOTCrosstvossimulator-arm64
    MicrosoftNETCoreAppRuntimeAOTCrosstvossimulator-x64
  ];
});
microsoft-net-runtime-android-aot = buildDotnetWorkload (sdkVersion: rec {
  pname = "microsoft-net-runtime-android-aot";
  version = "6.0.7";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.manifest-6.0.300";
    inherit version;
    hash = "sha256-m2W3IZkG04wqVTcq2rauXO3e8hWYh7eHaPc1T99kBjY=";
  };
  workloadName = "microsoft-net-runtime-android-aot";
  workloadPacks = [
    MicrosoftNETCoreAppRuntimeMonoandroid-arm
    MicrosoftNETCoreAppRuntimeMonoandroid-arm64
    MicrosoftNETCoreAppRuntimeMonoandroid-x64
    MicrosoftNETCoreAppRuntimeMonoandroid-x86
    MicrosoftNETCoreAppRuntimeMonobrowser-wasm
    MicrosoftNETCoreAppRuntimeMonoios-arm
    MicrosoftNETCoreAppRuntimeMonoios-arm64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-arm64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-x64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-x86
    MicrosoftNETCoreAppRuntimeMonomaccatalyst-arm64
    MicrosoftNETCoreAppRuntimeMonomaccatalyst-x64
    MicrosoftNETCoreAppRuntimeMonoosx-arm64
    MicrosoftNETCoreAppRuntimeMonoosx-x64
    MicrosoftNETCoreAppRuntimeMonotvos-arm64
    MicrosoftNETCoreAppRuntimeMonotvossimulator-arm64
    MicrosoftNETCoreAppRuntimeMonotvossimulator-x64
    MicrosoftNETCoreAppRuntimeosx-arm64
    MicrosoftNETCoreAppRuntimeosx-x64
    MicrosoftNETCoreAppRuntimewin-arm
    MicrosoftNETCoreAppRuntimewin-arm64
    MicrosoftNETCoreAppRuntimewin-x64
    MicrosoftNETCoreAppRuntimewin-x86
    MicrosoftNETRuntimeMonoAOTCompilerTask
    MicrosoftNETRuntimeMonoTargetsSdk
    MicrosoftNETRuntimeWebAssemblySdk
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-arm
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-x64
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-x86
    MicrosoftNETCoreAppRuntimeAOTCrossbrowser-wasm
    MicrosoftNETCoreAppRuntimeAOTCrossios-arm
    MicrosoftNETCoreAppRuntimeAOTCrossios-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-x64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-x86
    MicrosoftNETCoreAppRuntimeAOTCrossmaccatalyst-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossmaccatalyst-x64
    MicrosoftNETCoreAppRuntimeAOTCrosstvos-arm64
    MicrosoftNETCoreAppRuntimeAOTCrosstvossimulator-arm64
    MicrosoftNETCoreAppRuntimeAOTCrosstvossimulator-x64
  ];
});
microsoft-net-runtime-ios = buildDotnetWorkload (sdkVersion: rec {
  pname = "microsoft-net-runtime-ios";
  version = "6.0.7";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.manifest-6.0.300";
    inherit version;
    hash = "sha256-m2W3IZkG04wqVTcq2rauXO3e8hWYh7eHaPc1T99kBjY=";
  };
  workloadName = "microsoft-net-runtime-ios";
  workloadPacks = [
    MicrosoftNETCoreAppRuntimeMonoandroid-arm
    MicrosoftNETCoreAppRuntimeMonoandroid-arm64
    MicrosoftNETCoreAppRuntimeMonoandroid-x64
    MicrosoftNETCoreAppRuntimeMonoandroid-x86
    MicrosoftNETCoreAppRuntimeMonobrowser-wasm
    MicrosoftNETCoreAppRuntimeMonoios-arm
    MicrosoftNETCoreAppRuntimeMonoios-arm64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-arm64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-x64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-x86
    MicrosoftNETCoreAppRuntimeMonomaccatalyst-arm64
    MicrosoftNETCoreAppRuntimeMonomaccatalyst-x64
    MicrosoftNETCoreAppRuntimeMonoosx-arm64
    MicrosoftNETCoreAppRuntimeMonoosx-x64
    MicrosoftNETCoreAppRuntimeMonotvos-arm64
    MicrosoftNETCoreAppRuntimeMonotvossimulator-arm64
    MicrosoftNETCoreAppRuntimeMonotvossimulator-x64
    MicrosoftNETCoreAppRuntimeosx-arm64
    MicrosoftNETCoreAppRuntimeosx-x64
    MicrosoftNETCoreAppRuntimewin-arm
    MicrosoftNETCoreAppRuntimewin-arm64
    MicrosoftNETCoreAppRuntimewin-x64
    MicrosoftNETCoreAppRuntimewin-x86
    MicrosoftNETRuntimeMonoAOTCompilerTask
    MicrosoftNETRuntimeMonoTargetsSdk
    MicrosoftNETRuntimeWebAssemblySdk
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-arm
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-x64
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-x86
    MicrosoftNETCoreAppRuntimeAOTCrossbrowser-wasm
    MicrosoftNETCoreAppRuntimeAOTCrossios-arm
    MicrosoftNETCoreAppRuntimeAOTCrossios-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-x64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-x86
    MicrosoftNETCoreAppRuntimeAOTCrossmaccatalyst-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossmaccatalyst-x64
    MicrosoftNETCoreAppRuntimeAOTCrosstvos-arm64
    MicrosoftNETCoreAppRuntimeAOTCrosstvossimulator-arm64
    MicrosoftNETCoreAppRuntimeAOTCrosstvossimulator-x64
  ];
});
microsoft-net-runtime-maccatalyst = buildDotnetWorkload (sdkVersion: rec {
  pname = "microsoft-net-runtime-maccatalyst";
  version = "6.0.7";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.manifest-6.0.300";
    inherit version;
    hash = "sha256-m2W3IZkG04wqVTcq2rauXO3e8hWYh7eHaPc1T99kBjY=";
  };
  workloadName = "microsoft-net-runtime-maccatalyst";
  workloadPacks = [
    MicrosoftNETCoreAppRuntimeMonoandroid-arm
    MicrosoftNETCoreAppRuntimeMonoandroid-arm64
    MicrosoftNETCoreAppRuntimeMonoandroid-x64
    MicrosoftNETCoreAppRuntimeMonoandroid-x86
    MicrosoftNETCoreAppRuntimeMonobrowser-wasm
    MicrosoftNETCoreAppRuntimeMonoios-arm
    MicrosoftNETCoreAppRuntimeMonoios-arm64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-arm64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-x64
    MicrosoftNETCoreAppRuntimeMonoiossimulator-x86
    MicrosoftNETCoreAppRuntimeMonomaccatalyst-arm64
    MicrosoftNETCoreAppRuntimeMonomaccatalyst-x64
    MicrosoftNETCoreAppRuntimeMonoosx-arm64
    MicrosoftNETCoreAppRuntimeMonoosx-x64
    MicrosoftNETCoreAppRuntimeMonotvos-arm64
    MicrosoftNETCoreAppRuntimeMonotvossimulator-arm64
    MicrosoftNETCoreAppRuntimeMonotvossimulator-x64
    MicrosoftNETCoreAppRuntimeosx-arm64
    MicrosoftNETCoreAppRuntimeosx-x64
    MicrosoftNETCoreAppRuntimewin-arm
    MicrosoftNETCoreAppRuntimewin-arm64
    MicrosoftNETCoreAppRuntimewin-x64
    MicrosoftNETCoreAppRuntimewin-x86
    MicrosoftNETRuntimeMonoAOTCompilerTask
    MicrosoftNETRuntimeMonoTargetsSdk
    MicrosoftNETRuntimeWebAssemblySdk
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-arm
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-x64
    MicrosoftNETCoreAppRuntimeAOTCrossandroid-x86
    MicrosoftNETCoreAppRuntimeAOTCrossbrowser-wasm
    MicrosoftNETCoreAppRuntimeAOTCrossios-arm
    MicrosoftNETCoreAppRuntimeAOTCrossios-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-x64
    MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-x86
    MicrosoftNETCoreAppRuntimeAOTCrossmaccatalyst-arm64
    MicrosoftNETCoreAppRuntimeAOTCrossmaccatalyst-x64
    MicrosoftNETCoreAppRuntimeAOTCrosstvos-arm64
    MicrosoftNETCoreAppRuntimeAOTCrosstvossimulator-arm64
    MicrosoftNETCoreAppRuntimeAOTCrosstvossimulator-x64
  ];
});
MicrosoftAndroidRef31 = buildDotnetPack rec {
  pname = "Microsoft.Android.Ref.31";
  version = "32.0.440";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-FakjZ1zNXeNpwRACMVB60MkiCg+qXGiaS5uRLSyLSRw=";
  };
};
MicrosoftAndroidRef32 = buildDotnetPack rec {
  pname = "Microsoft.Android.Ref.32";
  version = "32.0.440";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-HsWLIZCtoVEb/gew5JuSwcWB9++lo3y0e2gKjjrZcDI=";
  };
};
MicrosoftAndroidRef33 = buildDotnetPack rec {
  pname = "Microsoft.Android.Ref.33";
  version = "32.0.440";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-BviY7FVd+5zADaaSE/EzOl6m+NWDEU43I12xDSrRtgA=";
  };
};
MicrosoftAndroidRuntime32android-arm = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.32.android-arm";
  version = "32.0.440";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-4hdDNzI4xDyhJGzwkn2Y3tkV3VrpBIJdOyYXkcAaBZM=";
  };
};
MicrosoftAndroidRuntime32android-arm64 = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.32.android-arm64";
  version = "32.0.440";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-NAuFGRfv+y17zVQIMFFPESCLYOTxCJy5jGbwNzh1aBc=";
  };
};
MicrosoftAndroidRuntime32android-x64 = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.32.android-x64";
  version = "32.0.440";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Qo1wK/WJ1BIPliDhUrq0I3ixNhOMwTa6iK39rIAQk7A=";
  };
};
MicrosoftAndroidRuntime32android-x86 = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.32.android-x86";
  version = "32.0.440";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-mcXsApa7n+GDYH0yBjGNYLSLU5BucmDi7O5ZFPf9g9M=";
  };
};
MicrosoftAndroidRuntime33android-arm = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.33.android-arm";
  version = "32.0.440";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-tJ0tlegoC3dZQEQ2304C8bXIq7+FbW328t2GFKget7I=";
  };
};
MicrosoftAndroidRuntime33android-arm64 = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.33.android-arm64";
  version = "32.0.440";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-YwZaxrvne1BL+SwPuTw/V18oTMV1EouZrABghg/eFL8=";
  };
};
MicrosoftAndroidRuntime33android-x64 = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.33.android-x64";
  version = "32.0.440";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-vVarDgeKLkimaGmPG1RT4pjvNGZa1BikhC8Aj5SuQiM=";
  };
};
MicrosoftAndroidRuntime33android-x86 = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.33.android-x86";
  version = "32.0.440";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-mDYYnutqqTsGtLGXq7+C3X4PdFl2z/kzrjziM7eDNMY=";
  };
};
MicrosoftAndroidSdkDarwin = buildDotnetPack rec {
  pname = "Microsoft.Android.Sdk.Darwin";
  version = "32.0.440";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-+fMNyVTuUauZcQu7/oJbxnofM0vQzglPDboIhJZZYps=";
  };
};
MicrosoftAndroidSdkLinux = buildDotnetPack rec {
  pname = "Microsoft.Android.Sdk.Linux";
  version = "32.0.440";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-gUuW9qJGqnQnuJFtKusA563BG1LQ5tGNnmcoSDpEI5Q=";
  };
};
MicrosoftAndroidSdkWindows = buildDotnetPack rec {
  pname = "Microsoft.Android.Sdk.Windows";
  version = "32.0.440";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-J1K7rEHNtSt2uvaDdjR2QPn4U6ipv5qUFUTqp2uVLCg=";
  };
};
MicrosoftAndroidTemplates = buildDotnetPack rec {
  pname = "Microsoft.Android.Templates";
  version = "32.0.440";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-XznpuA6IoIq3owBS90Noyas4wwAcREfzd2RJc7RsWcs=";
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
MicrosoftMacCatalystRef = buildDotnetPack rec {
  pname = "Microsoft.MacCatalyst.Ref";
  version = "15.4.328";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-L0TiY9SNluq4dr4Nw2B2v/qagH4uLXXv+AqYbmQTXFI=";
  };
};
MicrosoftMacCatalystRuntimemaccatalyst-arm64 = buildDotnetPack rec {
  pname = "Microsoft.MacCatalyst.Runtime.maccatalyst-arm64";
  version = "15.4.328";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-QxwjkIIKjyeZa5iVxDcWtXeCYSZlrj63rYPc0H0Um4s=";
  };
};
MicrosoftMacCatalystRuntimemaccatalyst-x64 = buildDotnetPack rec {
  pname = "Microsoft.MacCatalyst.Runtime.maccatalyst-x64";
  version = "15.4.328";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-/l6gv80KQamR7k0IKbJ1Yn789OFsMu+4Tq6xrC6wEyc=";
  };
};
MicrosoftMacCatalystSdk = buildDotnetPack rec {
  pname = "Microsoft.MacCatalyst.Sdk";
  version = "15.4.328";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-cT1W8GKym6gYlYvskolSYnRVmmQgHNu8hTmlETqnXks=";
  };
};
MicrosoftMacCatalystTemplates = buildDotnetPack rec {
  pname = "Microsoft.MacCatalyst.Templates";
  version = "15.4.328";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-X4W79o85ZAmCANi8N7slluJwZLQVizuFgDjWQbK6bCQ=";
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
MicrosoftMauiControlsRefany = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.any";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-WtVYlKEUwOlzcKccrYbhfjbO10n5KsdzuaqVtc18oJk=";
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
MicrosoftMauiControlsRefmaccatalyst = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.maccatalyst";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-1LX50BxsShn9KlagaWxcmEleUfsiDDY8gN33P3OLJm0=";
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
MicrosoftMauiControlsRefwin = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.win";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-FKkNs9RP/WRP+zKZrasnJWqAdEwuqJPumCWJ4ZdAVxQ=";
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
MicrosoftMauiControlsRuntimeany = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.any";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-yA4rgGNuNvHBEwNaetToWgR4/2O4sUIh8EmsV24uup4=";
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
MicrosoftMauiControlsRuntimemaccatalyst = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.maccatalyst";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-X3upqfxgxl/o9VyUlyBaWrkUVOR0dvOBzmocwowMSlw=";
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
MicrosoftMauiControlsRuntimewin = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.win";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-jh/CfuX3hSJT3gOjvC8rPx2tPjtHJP9cODjBBPM8ZZQ=";
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
MicrosoftMauiCoreRefany = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.any";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-XdQsKI5/huB1vY50eMxe0BQrM0bqe52E/b8FqWp4WvY=";
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
MicrosoftMauiCoreRefmaccatalyst = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.maccatalyst";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-//EOe7NsTCBW4gwI8gV/IWHGyHY4vYp04i34N3zJQmc=";
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
MicrosoftMauiCoreRefwin = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.win";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Pj6zqzIxctjh0fcCJXPJuZuhC/I6oNnPl6Irnxwc9ew=";
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
MicrosoftMauiCoreRuntimeany = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.any";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-oYMhaUVmyUbqTll3Z1ABKg3THak/vuosHZqfCs31dSQ=";
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
MicrosoftMauiCoreRuntimemaccatalyst = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.maccatalyst";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-7v7g0Sbzob8xQZb/Y2wJfotZzG9fB4n2bdJ/oK5Er+0=";
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
MicrosoftMauiCoreRuntimewin = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.win";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-xcOyrJ8+auEvR1CZUdGCu6v5evnIcBgrLnuXPSY7S30=";
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
MicrosoftMauiEssentialsRefandroid = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.android";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-2pDX2OYJoGyxQUcXkPTU1m7RiJtYm8CueaFzAQNXi2w=";
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
MicrosoftMauiEssentialsRefios = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.ios";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-+SE4Etpw9MSNnhN6vVnNsRJnGr5QizyqpnwXVlnLk2c=";
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
MicrosoftMauiEssentialsReftizen = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.tizen";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-LUdauad4VsKLq3ucwmwunmTbuATFAjeZYbELy9oSMsk=";
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
MicrosoftMauiEssentialsRuntimeandroid = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.android";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-z0BGue8EDLA/m5Lr0TjiM5RBM4Qht9RPgS+mXDZRd5o=";
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
MicrosoftMauiEssentialsRuntimeios = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.ios";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-XIiDpRpAgEfPHFjYoZTprx3Sr1CCN0FwSVs9MkvIFLY=";
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
MicrosoftMauiEssentialsRuntimetizen = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.tizen";
  version = "6.0.419";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-xloZcGAmqFnVDQlSbw6IHB5fJktR0Xj5kcbNpA1Rmls=";
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
MicrosoftMauiExtensions = buildDotnetPack rec {
  pname = "Microsoft.Maui.Extensions";
  version = "6.0.419";
  kind = "library";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-fPn1SVxxUPAGBEe1e7XAsehQRcv/u3K8uTpHMh0fcHY=";
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
MicrosoftMauiGraphicsWin2DWinUIDesktop = buildDotnetPack rec {
  pname = "Microsoft.Maui.Graphics.Win2D.WinUI.Desktop";
  version = "6.0.403";
  kind = "library";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-l5PY3nyW63W+0Ye+mawLB7TOZURiybI6wApCglBP4fg=";
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
MicrosoftMauiSdk = buildDotnetPack rec {
  pname = "Microsoft.Maui.Sdk";
  version = "6.0.419";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-zhkKx3FSL9tZBDeSu4drXZH1IV4OM2iMONv6Fk7dRBg=";
  };
};
MicrosoftMauiTemplates-60 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Templates-6.0";
  version = "6.0.419";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-feO/X1v/q9rszh9/foPush2fTQQh+w4tPx/h36RSPnE=";
  };
};
MicrosoftNETCoreAppRuntimeAOTlinux-x64Crossandroid-arm = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-arm";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-+PL/owiGY8mx1nv9yfeSqDxZbRdbvvdGzltWEhqv6P8=";
  };
};
MicrosoftNETCoreAppRuntimeAOTlinux-x64Crossandroid-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-arm64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-kIgFJIFeg5pSrXcAu0Bqu8T2KlFVbyFfR3V6wwqODY8=";
  };
};
MicrosoftNETCoreAppRuntimeAOTlinux-x64Crossandroid-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-x64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Q3l0b8H2ditlBgCPG3N7D4NBYLKNP3/kfT2TpW8GqI8=";
  };
};
MicrosoftNETCoreAppRuntimeAOTlinux-x64Crossandroid-x86 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-x86";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-8Zqu2E3eoiiuSckmMx6Ta6K5fvfJjchtyiudpdzIliI=";
  };
};
MicrosoftNETCoreAppRuntimeAOTlinux-x64Crossbrowser-wasm = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.browser-wasm";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-IcFulyvjoG4NT+RijpE+uxme6yq8tmWSh696qWAHK/s=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-arm = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-arm";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-iIcCjckUJHK8VU0w9qIvsphps9pxoLuB2qYu+kyXgPs=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-arm64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-3PXGVwgxgqj523dLLKEl+116pd/DLBoQ9iI7Fm3uXBI=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-x64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-wSnpwxjgNu9/zpivNmdEoiZMbuiaj5UVYGdh+NYV5KQ=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-x86 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-x86";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-JX2+USgf7IFIj6lHsr/1rgbE6uEl7B1F21DCpdE0D5U=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossbrowser-wasm = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.browser-wasm";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-N+unPaHq6YIBR3CUmvZ0frFU2T9eBylCs6jnIbq4mRk=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossios-arm = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.ios-arm";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-qk9J6q4WHLDSQDFhdLYIMpfHl69jWh37JFo85UJmO0A=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossios-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.ios-arm64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-NLagEE6utgoSROgzlj364heK+M9H6SwGTFsIts3komc=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossiossimulator-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.iossimulator-arm64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-vnRX/gl9/6Ko918fmOPfqxSW+xbXt0are9fwMXnbGAs=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossiossimulator-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.iossimulator-x64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Od0cOug7pxm/4quu+PikETGIqHKep4WkKRzu54U2ef8=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossiossimulator-x86 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.iossimulator-x86";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-K3gY26Q5tzr4cxm067uX93FfG3fVP02AO7rz1NVt4eM=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossmaccatalyst-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.maccatalyst-arm64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-r7jAsdVgzng9v1FcADkXvvY+ah95ohWlTTmxU/A2j4E=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crossmaccatalyst-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.maccatalyst-x64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-1b/ss9sU9T4z+pn/4jc+CtJk/iAMnuKFnnLfjyI7vr4=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crosstvos-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.tvos-arm64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-emBYagZbF1lC9QKU7/qTjEyQ1KY8Bc4/tyhTNJGhn0w=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crosstvossimulator-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.tvossimulator-arm64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-u/hQovpPiXBg8PMk/QhwdgLn928/BNOIARn0L8zkxIY=";
  };
};
MicrosoftNETCoreAppRuntimeAOTosx-x64Crosstvossimulator-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.tvossimulator-x64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-+raOwsJbfHG971+f6hfsGoPScNZJRIziBXzD5kuxqNg=";
  };
};
MicrosoftNETCoreAppRuntimeAOTwin-x64Crossandroid-arm = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-arm";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-MlDGDPhvtd7oNnY31PWhQ4tIzAP8lgAdIHXEfP6Qebo=";
  };
};
MicrosoftNETCoreAppRuntimeAOTwin-x64Crossandroid-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-arm64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-oP6N7JiSzVjiaiF5Er+ZeZ/LlqX2MMqUSd1bGHTRzME=";
  };
};
MicrosoftNETCoreAppRuntimeAOTwin-x64Crossandroid-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-x64";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-/5XWRtaKUVgCe3xTXYCsMM6ch5s8OFyqklcDZbKpeN4=";
  };
};
MicrosoftNETCoreAppRuntimeAOTwin-x64Crossandroid-x86 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-x86";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-FJPA41cEb5PJ+Dk2PDYueXmmIYOpddlsXzNKrSXhMQI=";
  };
};
MicrosoftNETCoreAppRuntimeAOTwin-x64Crossbrowser-wasm = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.browser-wasm";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-ZrQSc6g7p1fc9EN1/9H1gQq8l15dY/rO9Rl27aW79ls=";
  };
};
MicrosoftNETCoreAppRuntimeMonoandroid-arm = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.android-arm";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-6xaNIFOJ/clTna3klQ0ecZQ6dIBf45g6m7eRZa6kdAU=";
  };
};
MicrosoftNETCoreAppRuntimeMonoandroid-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.android-arm64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-BZpCo3GypyAaHWJ/i6OSqJlpX+0hxGduxEXSde7vumA=";
  };
};
MicrosoftNETCoreAppRuntimeMonoandroid-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.android-x64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-aUS9rxjrOYJ42VArH9tqWW1oh0svr96nty6Xh1Crshg=";
  };
};
MicrosoftNETCoreAppRuntimeMonoandroid-x86 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.android-x86";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-lybfluH743ZlCVgWvxaxy+ruJGhBdLfplfXgFHmmQYk=";
  };
};
MicrosoftNETCoreAppRuntimeMonobrowser-wasm = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.browser-wasm";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-LBJcf68p0BXpw+l3hf+MKOQZHKEgJAbiik8J5+i9+ko=";
  };
};
MicrosoftNETCoreAppRuntimeMonoios-arm = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.ios-arm";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-6e49fmlmhqZGn02hjvq6iL+RRbOBmsFLCYJjlk9Huvc=";
  };
};
MicrosoftNETCoreAppRuntimeMonoios-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.ios-arm64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-v2WAtgeO4N6Z9tuqsoRFX1gxCR255M3akKgbMgucxiY=";
  };
};
MicrosoftNETCoreAppRuntimeMonoiossimulator-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.iossimulator-arm64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-YwpBTm7sQnxKtoK//KkbFxI20XQT0mvQpPm7nf3azYw=";
  };
};
MicrosoftNETCoreAppRuntimeMonoiossimulator-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.iossimulator-x64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-kN6OmG7b4LxmPaRObMv/dsXDlPccoYr93uJUUNOMX6s=";
  };
};
MicrosoftNETCoreAppRuntimeMonoiossimulator-x86 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.iossimulator-x86";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-y94oH8E7jIDwiAgVxZll2ubHBcWC1vetJqy+mo/bOcw=";
  };
};
MicrosoftNETCoreAppRuntimeMonomaccatalyst-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.maccatalyst-arm64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-ZMnBvoEnBz+xrq6bbcrHnwIryMCUksdWhsjF0qJPlGY=";
  };
};
MicrosoftNETCoreAppRuntimeMonomaccatalyst-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.maccatalyst-x64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-yJmk3xojNb0TzWwk5ckU8zYnbeGdLrja2nEQozYoe6c=";
  };
};
MicrosoftNETCoreAppRuntimeMonoosx-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.osx-arm64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-RllN9/5CzpQl2TnYYMNhJ+naGU3vtpRpq38onhSYZmQ=";
  };
};
MicrosoftNETCoreAppRuntimeMonoosx-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.osx-x64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-cShA+eMwSqKuk7M4QwSOaHc/wgl4mFAlvdKSECDi3Lo=";
  };
};
MicrosoftNETCoreAppRuntimeMonotvos-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.tvos-arm64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-igEPcLAMaUGGJ1uR7XxEyOCRpSyETQBbIZz+10LmFTk=";
  };
};
MicrosoftNETCoreAppRuntimeMonotvossimulator-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.tvossimulator-arm64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-w7rrEA8ENAbCIPN2DmvOpo5pMJH/ZJhHhBM7ddIfjtE=";
  };
};
MicrosoftNETCoreAppRuntimeMonotvossimulator-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.tvossimulator-x64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-jH+XfodjeYRyJcOm8l55PGROBx25UkDFt98Qtuki3T8=";
  };
};
MicrosoftNETCoreAppRuntimeosx-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.osx-arm64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-I0koSVoqcTWrS3Md8tyECK4+Jf4R5u6R6rz6s3rcSEY=";
  };
};
MicrosoftNETCoreAppRuntimeosx-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.osx-x64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-O8f64cALZHt47AoGzwvVkMmsIpatnWuQYy6QrfLconU=";
  };
};
MicrosoftNETCoreAppRuntimewin-arm = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-arm";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-2XtuintqEbVK54O7kqU2AZNEkGjs9DIH5DkIkKmuQk8=";
  };
};
MicrosoftNETCoreAppRuntimewin-arm64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-arm64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-VEdcUwVjMs8Y3xC/DYPT44gW0uJReByHB4T1YQ6kKuQ=";
  };
};
MicrosoftNETCoreAppRuntimewin-x64 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-x64";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-gHZjZ5K63kjOiMqdBzNPOYP4L08Oz80b9dMleBjaMAI=";
  };
};
MicrosoftNETCoreAppRuntimewin-x86 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-x86";
  version = "6.0.7";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-x7aiFCZMCRPgGWH214460e5Fxh2pC6/wWTAcfXsL58s=";
  };
};
MicrosoftNETRuntimeMonoAOTCompilerTask = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.MonoAOTCompiler.Task";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-OHzj63VbJxmxu1F4xem9FJVINHYhbuF5dUfCGwicy2U=";
  };
};
MicrosoftNETRuntimeMonoTargetsSdk = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.MonoTargets.Sdk";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-yFcz0MLSwpLUMzS5vMRGCKtWmdDb6t6L0B2OckdMSNg=";
  };
};
MicrosoftNETRuntimeWebAssemblySdk = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.WebAssembly.Sdk";
  version = "6.0.7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-PW+XtIheBVcsHHGfH2narDy/NpiUZcLIJczdcAQgO0M=";
  };
};
MicrosoftiOSRef = buildDotnetPack rec {
  pname = "Microsoft.iOS.Ref";
  version = "15.4.328";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-lHl+fblNAiKZsootcTBOxcA8AZUcNTwGgrJN8TL2PX4=";
  };
};
MicrosoftiOSRuntimeios-arm = buildDotnetPack rec {
  pname = "Microsoft.iOS.Runtime.ios-arm";
  version = "15.4.328";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Z2Nrjk7y/SgzcB26bpmv8SoTd6AGSXOpVlKqkZOrTSA=";
  };
};
MicrosoftiOSRuntimeios-arm64 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Runtime.ios-arm64";
  version = "15.4.328";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-xL983SOQKdPAM3/9usGGZcb73SjDVIi6oak+b2JxsPY=";
  };
};
MicrosoftiOSRuntimeiossimulator-arm64 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Runtime.iossimulator-arm64";
  version = "15.4.328";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-eL/kfS9fW29smmI1lb9UNb8j5RJTg3mfMe2H10mHAiQ=";
  };
};
MicrosoftiOSRuntimeiossimulator-x64 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Runtime.iossimulator-x64";
  version = "15.4.328";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-g5lwKqqmT2CHTeuuVDhiRe4Gqyl32dFPBBAGvzPdQAw=";
  };
};
MicrosoftiOSRuntimeiossimulator-x86 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Runtime.iossimulator-x86";
  version = "15.4.328";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-tjstpG13bCys9ItlunriGZDxTAbhHAzTnHQ1JKf46b8=";
  };
};
MicrosoftiOSSdk = buildDotnetPack rec {
  pname = "Microsoft.iOS.Sdk";
  version = "15.4.328";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-GyXpzzKULrO+aqog4OCBgROSSHqX/g0t8du+BV598o0=";
  };
};
MicrosoftiOSTemplates = buildDotnetPack rec {
  pname = "Microsoft.iOS.Templates";
  version = "15.4.328";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-C3tGKPqmQmuqbPREAH0eKrgauhTC7fk8EMHNxajdgiI=";
  };
};
MicrosoftiOSWindowsSdk = buildDotnetPack rec {
  pname = "Microsoft.iOS.Windows.Sdk";
  version = "15.4.328";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-N3Sn/6GJXMkaESqR6OerkrFWTIjNDVcyU5M5rP5WUIs=";
  };
};
MicrosoftAndroidSdk = {"linux-x64" = MicrosoftAndroidSdkLinux;
"osx-arm64" = MicrosoftAndroidSdkDarwin;
"osx-x64" = MicrosoftAndroidSdkDarwin;
"win-arm64" = MicrosoftAndroidSdkWindows;
"win-x64" = MicrosoftAndroidSdkWindows;
"win-x86" = MicrosoftAndroidSdkWindows;};
MicrosoftNETCoreAppRuntimeAOTCrossandroid-arm = {"linux-x64" = MicrosoftNETCoreAppRuntimeAOTlinux-x64Crossandroid-arm;
"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-arm;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-arm;
"win-x64" = MicrosoftNETCoreAppRuntimeAOTwin-x64Crossandroid-arm;};
MicrosoftNETCoreAppRuntimeAOTCrossandroid-arm64 = {"linux-x64" = MicrosoftNETCoreAppRuntimeAOTlinux-x64Crossandroid-arm64;
"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-arm64;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-arm64;
"win-x64" = MicrosoftNETCoreAppRuntimeAOTwin-x64Crossandroid-arm64;};
MicrosoftNETCoreAppRuntimeAOTCrossandroid-x64 = {"linux-x64" = MicrosoftNETCoreAppRuntimeAOTlinux-x64Crossandroid-x64;
"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-x64;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-x64;
"win-x64" = MicrosoftNETCoreAppRuntimeAOTwin-x64Crossandroid-x64;};
MicrosoftNETCoreAppRuntimeAOTCrossandroid-x86 = {"linux-x64" = MicrosoftNETCoreAppRuntimeAOTlinux-x64Crossandroid-x86;
"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-x86;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossandroid-x86;
"win-x64" = MicrosoftNETCoreAppRuntimeAOTwin-x64Crossandroid-x86;};
MicrosoftNETCoreAppRuntimeAOTCrossbrowser-wasm = {"linux-x64" = MicrosoftNETCoreAppRuntimeAOTlinux-x64Crossbrowser-wasm;
"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossbrowser-wasm;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossbrowser-wasm;
"win-x64" = MicrosoftNETCoreAppRuntimeAOTwin-x64Crossbrowser-wasm;};
MicrosoftNETCoreAppRuntimeAOTCrossios-arm = {"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossios-arm;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossios-arm;};
MicrosoftNETCoreAppRuntimeAOTCrossios-arm64 = {"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossios-arm64;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossios-arm64;};
MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-arm64 = {"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossiossimulator-arm64;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossiossimulator-arm64;};
MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-x64 = {"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossiossimulator-x64;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossiossimulator-x64;};
MicrosoftNETCoreAppRuntimeAOTCrossiossimulator-x86 = {"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossiossimulator-x86;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossiossimulator-x86;};
MicrosoftNETCoreAppRuntimeAOTCrossmaccatalyst-arm64 = {"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossmaccatalyst-arm64;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossmaccatalyst-arm64;};
MicrosoftNETCoreAppRuntimeAOTCrossmaccatalyst-x64 = {"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossmaccatalyst-x64;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crossmaccatalyst-x64;};
MicrosoftNETCoreAppRuntimeAOTCrosstvos-arm64 = {"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crosstvos-arm64;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crosstvos-arm64;};
MicrosoftNETCoreAppRuntimeAOTCrosstvossimulator-arm64 = {"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crosstvossimulator-arm64;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crosstvossimulator-arm64;};
MicrosoftNETCoreAppRuntimeAOTCrosstvossimulator-x64 = {"osx-arm64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crosstvossimulator-x64;
"osx-x64" = MicrosoftNETCoreAppRuntimeAOTosx-x64Crosstvossimulator-x64;};
MicrosoftiOSWindowsSdkAliased = {"win-arm64" = MicrosoftiOSWindowsSdk;
"win-x64" = MicrosoftiOSWindowsSdk;
"win-x86" = MicrosoftiOSWindowsSdk;};
}