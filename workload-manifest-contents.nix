{ buildDotnetWorkload, fetchNuGet, buildDotnetPack }: rec {
android-33_0_26 = rec {
  pname = "android-33_0_26";
  version = "33.0.26";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.android.manifest-7.0.100";
    inherit version;
    hash = "sha256-hUYzhN1PJW5brOL654C55MMwTca8FED+5YRba6gAUM8=";
  };
  workloadName = "android";
  nugetName = "microsoft.net.sdk.android";
  workloadPacks = [
    Microsoft_Android_Ref_33-33_0_26
    Microsoft_Android_Runtime_33_android-arm-33_0_26
    Microsoft_Android_Runtime_33_android-arm64-33_0_26
    Microsoft_Android_Runtime_33_android-x64-33_0_26
    Microsoft_Android_Runtime_33_android-x86-33_0_26
    Microsoft_Android_Templates-33_0_26
    Microsoft_Android_Sdk_net6
    Microsoft_Android_Sdk_net7
  ];
};
ios-16_2_1007 = rec {
  pname = "ios-16_2_1007";
  version = "16.2.1007";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.ios.manifest-7.0.100";
    inherit version;
    hash = "sha256-5zP1OGmRYFh8aZN3+bdGfdjssqHIHTXk7h8DAaXrSuE=";
  };
  workloadName = "ios";
  nugetName = "microsoft.net.sdk.ios";
  workloadPacks = [
    Microsoft_iOS_Ref-16_2_1007
    Microsoft_iOS_Runtime_ios-arm-16_2_1007
    Microsoft_iOS_Runtime_ios-arm64-16_2_1007
    Microsoft_iOS_Runtime_iossimulator-arm64-16_2_1007
    Microsoft_iOS_Runtime_iossimulator-x64-16_2_1007
    Microsoft_iOS_Runtime_iossimulator-x86-16_2_1007
    Microsoft_iOS_Sdk_net6
    Microsoft_iOS_Sdk_net7
    Microsoft_iOS_Templates_net7
    Microsoft_iOS_Windows_Sdk_Aliased_net6
    Microsoft_iOS_Windows_Sdk_Aliased_net7
  ];
};
maccatalyst-16_2_1007 = rec {
  pname = "maccatalyst-16_2_1007";
  version = "16.2.1007";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maccatalyst.manifest-7.0.100";
    inherit version;
    hash = "sha256-5/Y326x127b2n0ZDzJ/CZtXs0e+BTrfz3UnrYjxl3X8=";
  };
  workloadName = "maccatalyst";
  nugetName = "microsoft.net.sdk.maccatalyst";
  workloadPacks = [
    Microsoft_MacCatalyst_Ref-16_2_1007
    Microsoft_MacCatalyst_Runtime_maccatalyst-arm64-16_2_1007
    Microsoft_MacCatalyst_Runtime_maccatalyst-x64-16_2_1007
    Microsoft_MacCatalyst_Sdk_net6
    Microsoft_MacCatalyst_Sdk_net7
    Microsoft_MacCatalyst_Templates_net7
  ];
};
macos-13_1_1007 = rec {
  pname = "macos-13_1_1007";
  version = "13.1.1007";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.macos.manifest-7.0.100";
    inherit version;
    hash = "sha256-+fQmJdjnvcrBAk0oMpe4ERB4A057J5PZGgwBlsl2tWc=";
  };
  workloadName = "macos";
  nugetName = "microsoft.net.sdk.macos";
  workloadPacks = [
    Microsoft_macOS_Ref-13_1_1007
    Microsoft_macOS_Runtime_osx-arm64-13_1_1007
    Microsoft_macOS_Runtime_osx-x64-13_1_1007
    Microsoft_macOS_Sdk_net6
    Microsoft_macOS_Sdk_net7
    Microsoft_macOS_Templates_net7
  ];
};
maui-7_0_58 = rec {
  pname = "maui-7_0_58";
  version = "7.0.58";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maui.manifest-7.0.100";
    inherit version;
    hash = "sha256-XJWcuJ8aY7+t7Zb6WiPq8CFaJlAyBXD+uNeO0oHAd8A=";
  };
  workloadName = "maui";
  nugetName = "microsoft.net.sdk.maui";
  workloadPacks = [
    Microsoft_AspNetCore_Components_WebView_Maui-7_0_58
    Microsoft_Maui_Controls_Ref_android-7_0_58
    Microsoft_Maui_Controls_Ref_any-7_0_58
    Microsoft_Maui_Controls_Ref_ios-7_0_58
    Microsoft_Maui_Controls_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Ref_tizen-7_0_58
    Microsoft_Maui_Controls_Ref_win-7_0_58
    Microsoft_Maui_Controls_Runtime_android-7_0_58
    Microsoft_Maui_Controls_Runtime_any-7_0_58
    Microsoft_Maui_Controls_Runtime_ios-7_0_58
    Microsoft_Maui_Controls_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Runtime_tizen-7_0_58
    Microsoft_Maui_Controls_Runtime_win-7_0_58
    Microsoft_Maui_Core_Ref_android-7_0_58
    Microsoft_Maui_Core_Ref_any-7_0_58
    Microsoft_Maui_Core_Ref_ios-7_0_58
    Microsoft_Maui_Core_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Core_Ref_tizen-7_0_58
    Microsoft_Maui_Core_Ref_win-7_0_58
    Microsoft_Maui_Core_Runtime_android-7_0_58
    Microsoft_Maui_Core_Runtime_any-7_0_58
    Microsoft_Maui_Core_Runtime_ios-7_0_58
    Microsoft_Maui_Core_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Core_Runtime_tizen-7_0_58
    Microsoft_Maui_Core_Runtime_win-7_0_58
    Microsoft_Maui_Essentials_Ref_android-7_0_58
    Microsoft_Maui_Essentials_Ref_any-7_0_58
    Microsoft_Maui_Essentials_Ref_ios-7_0_58
    Microsoft_Maui_Essentials_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Ref_tizen-7_0_58
    Microsoft_Maui_Essentials_Ref_win-7_0_58
    Microsoft_Maui_Essentials_Runtime_android-7_0_58
    Microsoft_Maui_Essentials_Runtime_any-7_0_58
    Microsoft_Maui_Essentials_Runtime_ios-7_0_58
    Microsoft_Maui_Essentials_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Runtime_tizen-7_0_58
    Microsoft_Maui_Essentials_Runtime_win-7_0_58
    Microsoft_Maui_Graphics-7_0_58
    Microsoft_Maui_Graphics_Win2D_WinUI_Desktop-7_0_58
    Microsoft_Maui_Resizetizer_Sdk-7_0_58
    Microsoft_Maui_Templates_net6-6_0_550
    Microsoft_Maui_Templates_net7-7_0_58
    Microsoft_Maui_Sdk_net6
    Microsoft_Maui_Sdk_net7
  ];
};
maui-android-7_0_58 = rec {
  pname = "maui-android-7_0_58";
  version = "7.0.58";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maui.manifest-7.0.100";
    inherit version;
    hash = "sha256-XJWcuJ8aY7+t7Zb6WiPq8CFaJlAyBXD+uNeO0oHAd8A=";
  };
  workloadName = "maui-android";
  nugetName = "microsoft.net.sdk.maui";
  workloadPacks = [
    Microsoft_AspNetCore_Components_WebView_Maui-7_0_58
    Microsoft_Maui_Controls_Ref_android-7_0_58
    Microsoft_Maui_Controls_Ref_any-7_0_58
    Microsoft_Maui_Controls_Ref_ios-7_0_58
    Microsoft_Maui_Controls_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Ref_tizen-7_0_58
    Microsoft_Maui_Controls_Ref_win-7_0_58
    Microsoft_Maui_Controls_Runtime_android-7_0_58
    Microsoft_Maui_Controls_Runtime_any-7_0_58
    Microsoft_Maui_Controls_Runtime_ios-7_0_58
    Microsoft_Maui_Controls_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Runtime_tizen-7_0_58
    Microsoft_Maui_Controls_Runtime_win-7_0_58
    Microsoft_Maui_Core_Ref_android-7_0_58
    Microsoft_Maui_Core_Ref_any-7_0_58
    Microsoft_Maui_Core_Ref_ios-7_0_58
    Microsoft_Maui_Core_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Core_Ref_tizen-7_0_58
    Microsoft_Maui_Core_Ref_win-7_0_58
    Microsoft_Maui_Core_Runtime_android-7_0_58
    Microsoft_Maui_Core_Runtime_any-7_0_58
    Microsoft_Maui_Core_Runtime_ios-7_0_58
    Microsoft_Maui_Core_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Core_Runtime_tizen-7_0_58
    Microsoft_Maui_Core_Runtime_win-7_0_58
    Microsoft_Maui_Essentials_Ref_android-7_0_58
    Microsoft_Maui_Essentials_Ref_any-7_0_58
    Microsoft_Maui_Essentials_Ref_ios-7_0_58
    Microsoft_Maui_Essentials_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Ref_tizen-7_0_58
    Microsoft_Maui_Essentials_Ref_win-7_0_58
    Microsoft_Maui_Essentials_Runtime_android-7_0_58
    Microsoft_Maui_Essentials_Runtime_any-7_0_58
    Microsoft_Maui_Essentials_Runtime_ios-7_0_58
    Microsoft_Maui_Essentials_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Runtime_tizen-7_0_58
    Microsoft_Maui_Essentials_Runtime_win-7_0_58
    Microsoft_Maui_Graphics-7_0_58
    Microsoft_Maui_Graphics_Win2D_WinUI_Desktop-7_0_58
    Microsoft_Maui_Resizetizer_Sdk-7_0_58
    Microsoft_Maui_Templates_net6-6_0_550
    Microsoft_Maui_Templates_net7-7_0_58
    Microsoft_Maui_Sdk_net6
    Microsoft_Maui_Sdk_net7
  ];
};
maui-blazor-7_0_58 = rec {
  pname = "maui-blazor-7_0_58";
  version = "7.0.58";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maui.manifest-7.0.100";
    inherit version;
    hash = "sha256-XJWcuJ8aY7+t7Zb6WiPq8CFaJlAyBXD+uNeO0oHAd8A=";
  };
  workloadName = "maui-blazor";
  nugetName = "microsoft.net.sdk.maui";
  workloadPacks = [
    Microsoft_AspNetCore_Components_WebView_Maui-7_0_58
    Microsoft_Maui_Controls_Ref_android-7_0_58
    Microsoft_Maui_Controls_Ref_any-7_0_58
    Microsoft_Maui_Controls_Ref_ios-7_0_58
    Microsoft_Maui_Controls_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Ref_tizen-7_0_58
    Microsoft_Maui_Controls_Ref_win-7_0_58
    Microsoft_Maui_Controls_Runtime_android-7_0_58
    Microsoft_Maui_Controls_Runtime_any-7_0_58
    Microsoft_Maui_Controls_Runtime_ios-7_0_58
    Microsoft_Maui_Controls_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Runtime_tizen-7_0_58
    Microsoft_Maui_Controls_Runtime_win-7_0_58
    Microsoft_Maui_Core_Ref_android-7_0_58
    Microsoft_Maui_Core_Ref_any-7_0_58
    Microsoft_Maui_Core_Ref_ios-7_0_58
    Microsoft_Maui_Core_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Core_Ref_tizen-7_0_58
    Microsoft_Maui_Core_Ref_win-7_0_58
    Microsoft_Maui_Core_Runtime_android-7_0_58
    Microsoft_Maui_Core_Runtime_any-7_0_58
    Microsoft_Maui_Core_Runtime_ios-7_0_58
    Microsoft_Maui_Core_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Core_Runtime_tizen-7_0_58
    Microsoft_Maui_Core_Runtime_win-7_0_58
    Microsoft_Maui_Essentials_Ref_android-7_0_58
    Microsoft_Maui_Essentials_Ref_any-7_0_58
    Microsoft_Maui_Essentials_Ref_ios-7_0_58
    Microsoft_Maui_Essentials_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Ref_tizen-7_0_58
    Microsoft_Maui_Essentials_Ref_win-7_0_58
    Microsoft_Maui_Essentials_Runtime_android-7_0_58
    Microsoft_Maui_Essentials_Runtime_any-7_0_58
    Microsoft_Maui_Essentials_Runtime_ios-7_0_58
    Microsoft_Maui_Essentials_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Runtime_tizen-7_0_58
    Microsoft_Maui_Essentials_Runtime_win-7_0_58
    Microsoft_Maui_Graphics-7_0_58
    Microsoft_Maui_Graphics_Win2D_WinUI_Desktop-7_0_58
    Microsoft_Maui_Resizetizer_Sdk-7_0_58
    Microsoft_Maui_Templates_net6-6_0_550
    Microsoft_Maui_Templates_net7-7_0_58
    Microsoft_Maui_Sdk_net6
    Microsoft_Maui_Sdk_net7
  ];
};
maui-core-7_0_58 = rec {
  pname = "maui-core-7_0_58";
  version = "7.0.58";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maui.manifest-7.0.100";
    inherit version;
    hash = "sha256-XJWcuJ8aY7+t7Zb6WiPq8CFaJlAyBXD+uNeO0oHAd8A=";
  };
  workloadName = "maui-core";
  nugetName = "microsoft.net.sdk.maui";
  workloadPacks = [
    Microsoft_AspNetCore_Components_WebView_Maui-7_0_58
    Microsoft_Maui_Controls_Ref_android-7_0_58
    Microsoft_Maui_Controls_Ref_any-7_0_58
    Microsoft_Maui_Controls_Ref_ios-7_0_58
    Microsoft_Maui_Controls_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Ref_tizen-7_0_58
    Microsoft_Maui_Controls_Ref_win-7_0_58
    Microsoft_Maui_Controls_Runtime_android-7_0_58
    Microsoft_Maui_Controls_Runtime_any-7_0_58
    Microsoft_Maui_Controls_Runtime_ios-7_0_58
    Microsoft_Maui_Controls_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Runtime_tizen-7_0_58
    Microsoft_Maui_Controls_Runtime_win-7_0_58
    Microsoft_Maui_Core_Ref_android-7_0_58
    Microsoft_Maui_Core_Ref_any-7_0_58
    Microsoft_Maui_Core_Ref_ios-7_0_58
    Microsoft_Maui_Core_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Core_Ref_tizen-7_0_58
    Microsoft_Maui_Core_Ref_win-7_0_58
    Microsoft_Maui_Core_Runtime_android-7_0_58
    Microsoft_Maui_Core_Runtime_any-7_0_58
    Microsoft_Maui_Core_Runtime_ios-7_0_58
    Microsoft_Maui_Core_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Core_Runtime_tizen-7_0_58
    Microsoft_Maui_Core_Runtime_win-7_0_58
    Microsoft_Maui_Essentials_Ref_android-7_0_58
    Microsoft_Maui_Essentials_Ref_any-7_0_58
    Microsoft_Maui_Essentials_Ref_ios-7_0_58
    Microsoft_Maui_Essentials_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Ref_tizen-7_0_58
    Microsoft_Maui_Essentials_Ref_win-7_0_58
    Microsoft_Maui_Essentials_Runtime_android-7_0_58
    Microsoft_Maui_Essentials_Runtime_any-7_0_58
    Microsoft_Maui_Essentials_Runtime_ios-7_0_58
    Microsoft_Maui_Essentials_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Runtime_tizen-7_0_58
    Microsoft_Maui_Essentials_Runtime_win-7_0_58
    Microsoft_Maui_Graphics-7_0_58
    Microsoft_Maui_Graphics_Win2D_WinUI_Desktop-7_0_58
    Microsoft_Maui_Resizetizer_Sdk-7_0_58
    Microsoft_Maui_Templates_net6-6_0_550
    Microsoft_Maui_Templates_net7-7_0_58
    Microsoft_Maui_Sdk_net6
    Microsoft_Maui_Sdk_net7
  ];
};
maui-desktop-7_0_58 = rec {
  pname = "maui-desktop-7_0_58";
  version = "7.0.58";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maui.manifest-7.0.100";
    inherit version;
    hash = "sha256-XJWcuJ8aY7+t7Zb6WiPq8CFaJlAyBXD+uNeO0oHAd8A=";
  };
  workloadName = "maui-desktop";
  nugetName = "microsoft.net.sdk.maui";
  workloadPacks = [
    Microsoft_AspNetCore_Components_WebView_Maui-7_0_58
    Microsoft_Maui_Controls_Ref_android-7_0_58
    Microsoft_Maui_Controls_Ref_any-7_0_58
    Microsoft_Maui_Controls_Ref_ios-7_0_58
    Microsoft_Maui_Controls_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Ref_tizen-7_0_58
    Microsoft_Maui_Controls_Ref_win-7_0_58
    Microsoft_Maui_Controls_Runtime_android-7_0_58
    Microsoft_Maui_Controls_Runtime_any-7_0_58
    Microsoft_Maui_Controls_Runtime_ios-7_0_58
    Microsoft_Maui_Controls_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Runtime_tizen-7_0_58
    Microsoft_Maui_Controls_Runtime_win-7_0_58
    Microsoft_Maui_Core_Ref_android-7_0_58
    Microsoft_Maui_Core_Ref_any-7_0_58
    Microsoft_Maui_Core_Ref_ios-7_0_58
    Microsoft_Maui_Core_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Core_Ref_tizen-7_0_58
    Microsoft_Maui_Core_Ref_win-7_0_58
    Microsoft_Maui_Core_Runtime_android-7_0_58
    Microsoft_Maui_Core_Runtime_any-7_0_58
    Microsoft_Maui_Core_Runtime_ios-7_0_58
    Microsoft_Maui_Core_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Core_Runtime_tizen-7_0_58
    Microsoft_Maui_Core_Runtime_win-7_0_58
    Microsoft_Maui_Essentials_Ref_android-7_0_58
    Microsoft_Maui_Essentials_Ref_any-7_0_58
    Microsoft_Maui_Essentials_Ref_ios-7_0_58
    Microsoft_Maui_Essentials_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Ref_tizen-7_0_58
    Microsoft_Maui_Essentials_Ref_win-7_0_58
    Microsoft_Maui_Essentials_Runtime_android-7_0_58
    Microsoft_Maui_Essentials_Runtime_any-7_0_58
    Microsoft_Maui_Essentials_Runtime_ios-7_0_58
    Microsoft_Maui_Essentials_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Runtime_tizen-7_0_58
    Microsoft_Maui_Essentials_Runtime_win-7_0_58
    Microsoft_Maui_Graphics-7_0_58
    Microsoft_Maui_Graphics_Win2D_WinUI_Desktop-7_0_58
    Microsoft_Maui_Resizetizer_Sdk-7_0_58
    Microsoft_Maui_Templates_net6-6_0_550
    Microsoft_Maui_Templates_net7-7_0_58
    Microsoft_Maui_Sdk_net6
    Microsoft_Maui_Sdk_net7
  ];
};
maui-ios-7_0_58 = rec {
  pname = "maui-ios-7_0_58";
  version = "7.0.58";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maui.manifest-7.0.100";
    inherit version;
    hash = "sha256-XJWcuJ8aY7+t7Zb6WiPq8CFaJlAyBXD+uNeO0oHAd8A=";
  };
  workloadName = "maui-ios";
  nugetName = "microsoft.net.sdk.maui";
  workloadPacks = [
    Microsoft_AspNetCore_Components_WebView_Maui-7_0_58
    Microsoft_Maui_Controls_Ref_android-7_0_58
    Microsoft_Maui_Controls_Ref_any-7_0_58
    Microsoft_Maui_Controls_Ref_ios-7_0_58
    Microsoft_Maui_Controls_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Ref_tizen-7_0_58
    Microsoft_Maui_Controls_Ref_win-7_0_58
    Microsoft_Maui_Controls_Runtime_android-7_0_58
    Microsoft_Maui_Controls_Runtime_any-7_0_58
    Microsoft_Maui_Controls_Runtime_ios-7_0_58
    Microsoft_Maui_Controls_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Runtime_tizen-7_0_58
    Microsoft_Maui_Controls_Runtime_win-7_0_58
    Microsoft_Maui_Core_Ref_android-7_0_58
    Microsoft_Maui_Core_Ref_any-7_0_58
    Microsoft_Maui_Core_Ref_ios-7_0_58
    Microsoft_Maui_Core_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Core_Ref_tizen-7_0_58
    Microsoft_Maui_Core_Ref_win-7_0_58
    Microsoft_Maui_Core_Runtime_android-7_0_58
    Microsoft_Maui_Core_Runtime_any-7_0_58
    Microsoft_Maui_Core_Runtime_ios-7_0_58
    Microsoft_Maui_Core_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Core_Runtime_tizen-7_0_58
    Microsoft_Maui_Core_Runtime_win-7_0_58
    Microsoft_Maui_Essentials_Ref_android-7_0_58
    Microsoft_Maui_Essentials_Ref_any-7_0_58
    Microsoft_Maui_Essentials_Ref_ios-7_0_58
    Microsoft_Maui_Essentials_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Ref_tizen-7_0_58
    Microsoft_Maui_Essentials_Ref_win-7_0_58
    Microsoft_Maui_Essentials_Runtime_android-7_0_58
    Microsoft_Maui_Essentials_Runtime_any-7_0_58
    Microsoft_Maui_Essentials_Runtime_ios-7_0_58
    Microsoft_Maui_Essentials_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Runtime_tizen-7_0_58
    Microsoft_Maui_Essentials_Runtime_win-7_0_58
    Microsoft_Maui_Graphics-7_0_58
    Microsoft_Maui_Graphics_Win2D_WinUI_Desktop-7_0_58
    Microsoft_Maui_Resizetizer_Sdk-7_0_58
    Microsoft_Maui_Templates_net6-6_0_550
    Microsoft_Maui_Templates_net7-7_0_58
    Microsoft_Maui_Sdk_net6
    Microsoft_Maui_Sdk_net7
  ];
};
maui-maccatalyst-7_0_58 = rec {
  pname = "maui-maccatalyst-7_0_58";
  version = "7.0.58";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maui.manifest-7.0.100";
    inherit version;
    hash = "sha256-XJWcuJ8aY7+t7Zb6WiPq8CFaJlAyBXD+uNeO0oHAd8A=";
  };
  workloadName = "maui-maccatalyst";
  nugetName = "microsoft.net.sdk.maui";
  workloadPacks = [
    Microsoft_AspNetCore_Components_WebView_Maui-7_0_58
    Microsoft_Maui_Controls_Ref_android-7_0_58
    Microsoft_Maui_Controls_Ref_any-7_0_58
    Microsoft_Maui_Controls_Ref_ios-7_0_58
    Microsoft_Maui_Controls_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Ref_tizen-7_0_58
    Microsoft_Maui_Controls_Ref_win-7_0_58
    Microsoft_Maui_Controls_Runtime_android-7_0_58
    Microsoft_Maui_Controls_Runtime_any-7_0_58
    Microsoft_Maui_Controls_Runtime_ios-7_0_58
    Microsoft_Maui_Controls_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Runtime_tizen-7_0_58
    Microsoft_Maui_Controls_Runtime_win-7_0_58
    Microsoft_Maui_Core_Ref_android-7_0_58
    Microsoft_Maui_Core_Ref_any-7_0_58
    Microsoft_Maui_Core_Ref_ios-7_0_58
    Microsoft_Maui_Core_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Core_Ref_tizen-7_0_58
    Microsoft_Maui_Core_Ref_win-7_0_58
    Microsoft_Maui_Core_Runtime_android-7_0_58
    Microsoft_Maui_Core_Runtime_any-7_0_58
    Microsoft_Maui_Core_Runtime_ios-7_0_58
    Microsoft_Maui_Core_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Core_Runtime_tizen-7_0_58
    Microsoft_Maui_Core_Runtime_win-7_0_58
    Microsoft_Maui_Essentials_Ref_android-7_0_58
    Microsoft_Maui_Essentials_Ref_any-7_0_58
    Microsoft_Maui_Essentials_Ref_ios-7_0_58
    Microsoft_Maui_Essentials_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Ref_tizen-7_0_58
    Microsoft_Maui_Essentials_Ref_win-7_0_58
    Microsoft_Maui_Essentials_Runtime_android-7_0_58
    Microsoft_Maui_Essentials_Runtime_any-7_0_58
    Microsoft_Maui_Essentials_Runtime_ios-7_0_58
    Microsoft_Maui_Essentials_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Runtime_tizen-7_0_58
    Microsoft_Maui_Essentials_Runtime_win-7_0_58
    Microsoft_Maui_Graphics-7_0_58
    Microsoft_Maui_Graphics_Win2D_WinUI_Desktop-7_0_58
    Microsoft_Maui_Resizetizer_Sdk-7_0_58
    Microsoft_Maui_Templates_net6-6_0_550
    Microsoft_Maui_Templates_net7-7_0_58
    Microsoft_Maui_Sdk_net6
    Microsoft_Maui_Sdk_net7
  ];
};
maui-mobile-7_0_58 = rec {
  pname = "maui-mobile-7_0_58";
  version = "7.0.58";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maui.manifest-7.0.100";
    inherit version;
    hash = "sha256-XJWcuJ8aY7+t7Zb6WiPq8CFaJlAyBXD+uNeO0oHAd8A=";
  };
  workloadName = "maui-mobile";
  nugetName = "microsoft.net.sdk.maui";
  workloadPacks = [
    Microsoft_AspNetCore_Components_WebView_Maui-7_0_58
    Microsoft_Maui_Controls_Ref_android-7_0_58
    Microsoft_Maui_Controls_Ref_any-7_0_58
    Microsoft_Maui_Controls_Ref_ios-7_0_58
    Microsoft_Maui_Controls_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Ref_tizen-7_0_58
    Microsoft_Maui_Controls_Ref_win-7_0_58
    Microsoft_Maui_Controls_Runtime_android-7_0_58
    Microsoft_Maui_Controls_Runtime_any-7_0_58
    Microsoft_Maui_Controls_Runtime_ios-7_0_58
    Microsoft_Maui_Controls_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Runtime_tizen-7_0_58
    Microsoft_Maui_Controls_Runtime_win-7_0_58
    Microsoft_Maui_Core_Ref_android-7_0_58
    Microsoft_Maui_Core_Ref_any-7_0_58
    Microsoft_Maui_Core_Ref_ios-7_0_58
    Microsoft_Maui_Core_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Core_Ref_tizen-7_0_58
    Microsoft_Maui_Core_Ref_win-7_0_58
    Microsoft_Maui_Core_Runtime_android-7_0_58
    Microsoft_Maui_Core_Runtime_any-7_0_58
    Microsoft_Maui_Core_Runtime_ios-7_0_58
    Microsoft_Maui_Core_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Core_Runtime_tizen-7_0_58
    Microsoft_Maui_Core_Runtime_win-7_0_58
    Microsoft_Maui_Essentials_Ref_android-7_0_58
    Microsoft_Maui_Essentials_Ref_any-7_0_58
    Microsoft_Maui_Essentials_Ref_ios-7_0_58
    Microsoft_Maui_Essentials_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Ref_tizen-7_0_58
    Microsoft_Maui_Essentials_Ref_win-7_0_58
    Microsoft_Maui_Essentials_Runtime_android-7_0_58
    Microsoft_Maui_Essentials_Runtime_any-7_0_58
    Microsoft_Maui_Essentials_Runtime_ios-7_0_58
    Microsoft_Maui_Essentials_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Runtime_tizen-7_0_58
    Microsoft_Maui_Essentials_Runtime_win-7_0_58
    Microsoft_Maui_Graphics-7_0_58
    Microsoft_Maui_Graphics_Win2D_WinUI_Desktop-7_0_58
    Microsoft_Maui_Resizetizer_Sdk-7_0_58
    Microsoft_Maui_Templates_net6-6_0_550
    Microsoft_Maui_Templates_net7-7_0_58
    Microsoft_Maui_Sdk_net6
    Microsoft_Maui_Sdk_net7
  ];
};
maui-tizen-7_0_58 = rec {
  pname = "maui-tizen-7_0_58";
  version = "7.0.58";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maui.manifest-7.0.100";
    inherit version;
    hash = "sha256-XJWcuJ8aY7+t7Zb6WiPq8CFaJlAyBXD+uNeO0oHAd8A=";
  };
  workloadName = "maui-tizen";
  nugetName = "microsoft.net.sdk.maui";
  workloadPacks = [
    Microsoft_AspNetCore_Components_WebView_Maui-7_0_58
    Microsoft_Maui_Controls_Ref_android-7_0_58
    Microsoft_Maui_Controls_Ref_any-7_0_58
    Microsoft_Maui_Controls_Ref_ios-7_0_58
    Microsoft_Maui_Controls_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Ref_tizen-7_0_58
    Microsoft_Maui_Controls_Ref_win-7_0_58
    Microsoft_Maui_Controls_Runtime_android-7_0_58
    Microsoft_Maui_Controls_Runtime_any-7_0_58
    Microsoft_Maui_Controls_Runtime_ios-7_0_58
    Microsoft_Maui_Controls_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Runtime_tizen-7_0_58
    Microsoft_Maui_Controls_Runtime_win-7_0_58
    Microsoft_Maui_Core_Ref_android-7_0_58
    Microsoft_Maui_Core_Ref_any-7_0_58
    Microsoft_Maui_Core_Ref_ios-7_0_58
    Microsoft_Maui_Core_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Core_Ref_tizen-7_0_58
    Microsoft_Maui_Core_Ref_win-7_0_58
    Microsoft_Maui_Core_Runtime_android-7_0_58
    Microsoft_Maui_Core_Runtime_any-7_0_58
    Microsoft_Maui_Core_Runtime_ios-7_0_58
    Microsoft_Maui_Core_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Core_Runtime_tizen-7_0_58
    Microsoft_Maui_Core_Runtime_win-7_0_58
    Microsoft_Maui_Essentials_Ref_android-7_0_58
    Microsoft_Maui_Essentials_Ref_any-7_0_58
    Microsoft_Maui_Essentials_Ref_ios-7_0_58
    Microsoft_Maui_Essentials_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Ref_tizen-7_0_58
    Microsoft_Maui_Essentials_Ref_win-7_0_58
    Microsoft_Maui_Essentials_Runtime_android-7_0_58
    Microsoft_Maui_Essentials_Runtime_any-7_0_58
    Microsoft_Maui_Essentials_Runtime_ios-7_0_58
    Microsoft_Maui_Essentials_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Runtime_tizen-7_0_58
    Microsoft_Maui_Essentials_Runtime_win-7_0_58
    Microsoft_Maui_Graphics-7_0_58
    Microsoft_Maui_Graphics_Win2D_WinUI_Desktop-7_0_58
    Microsoft_Maui_Resizetizer_Sdk-7_0_58
    Microsoft_Maui_Templates_net6-6_0_550
    Microsoft_Maui_Templates_net7-7_0_58
    Microsoft_Maui_Sdk_net6
    Microsoft_Maui_Sdk_net7
  ];
};
maui-windows-7_0_58 = rec {
  pname = "maui-windows-7_0_58";
  version = "7.0.58";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.maui.manifest-7.0.100";
    inherit version;
    hash = "sha256-XJWcuJ8aY7+t7Zb6WiPq8CFaJlAyBXD+uNeO0oHAd8A=";
  };
  workloadName = "maui-windows";
  nugetName = "microsoft.net.sdk.maui";
  workloadPacks = [
    Microsoft_AspNetCore_Components_WebView_Maui-7_0_58
    Microsoft_Maui_Controls_Ref_android-7_0_58
    Microsoft_Maui_Controls_Ref_any-7_0_58
    Microsoft_Maui_Controls_Ref_ios-7_0_58
    Microsoft_Maui_Controls_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Ref_tizen-7_0_58
    Microsoft_Maui_Controls_Ref_win-7_0_58
    Microsoft_Maui_Controls_Runtime_android-7_0_58
    Microsoft_Maui_Controls_Runtime_any-7_0_58
    Microsoft_Maui_Controls_Runtime_ios-7_0_58
    Microsoft_Maui_Controls_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Controls_Runtime_tizen-7_0_58
    Microsoft_Maui_Controls_Runtime_win-7_0_58
    Microsoft_Maui_Core_Ref_android-7_0_58
    Microsoft_Maui_Core_Ref_any-7_0_58
    Microsoft_Maui_Core_Ref_ios-7_0_58
    Microsoft_Maui_Core_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Core_Ref_tizen-7_0_58
    Microsoft_Maui_Core_Ref_win-7_0_58
    Microsoft_Maui_Core_Runtime_android-7_0_58
    Microsoft_Maui_Core_Runtime_any-7_0_58
    Microsoft_Maui_Core_Runtime_ios-7_0_58
    Microsoft_Maui_Core_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Core_Runtime_tizen-7_0_58
    Microsoft_Maui_Core_Runtime_win-7_0_58
    Microsoft_Maui_Essentials_Ref_android-7_0_58
    Microsoft_Maui_Essentials_Ref_any-7_0_58
    Microsoft_Maui_Essentials_Ref_ios-7_0_58
    Microsoft_Maui_Essentials_Ref_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Ref_tizen-7_0_58
    Microsoft_Maui_Essentials_Ref_win-7_0_58
    Microsoft_Maui_Essentials_Runtime_android-7_0_58
    Microsoft_Maui_Essentials_Runtime_any-7_0_58
    Microsoft_Maui_Essentials_Runtime_ios-7_0_58
    Microsoft_Maui_Essentials_Runtime_maccatalyst-7_0_58
    Microsoft_Maui_Essentials_Runtime_tizen-7_0_58
    Microsoft_Maui_Essentials_Runtime_win-7_0_58
    Microsoft_Maui_Graphics-7_0_58
    Microsoft_Maui_Graphics_Win2D_WinUI_Desktop-7_0_58
    Microsoft_Maui_Resizetizer_Sdk-7_0_58
    Microsoft_Maui_Templates_net6-6_0_550
    Microsoft_Maui_Templates_net7-7_0_58
    Microsoft_Maui_Sdk_net6
    Microsoft_Maui_Sdk_net7
  ];
};
microsoft-net-runtime-android-7_0_2 = rec {
  pname = "microsoft-net-runtime-android-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "microsoft-net-runtime-android";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
microsoft-net-runtime-android-aot-7_0_2 = rec {
  pname = "microsoft-net-runtime-android-aot-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "microsoft-net-runtime-android-aot";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
microsoft-net-runtime-android-aot-net6-7_0_2 = rec {
  pname = "microsoft-net-runtime-android-aot-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "microsoft-net-runtime-android-aot-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
microsoft-net-runtime-android-net6-7_0_2 = rec {
  pname = "microsoft-net-runtime-android-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "microsoft-net-runtime-android-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
microsoft-net-runtime-ios-7_0_2 = rec {
  pname = "microsoft-net-runtime-ios-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "microsoft-net-runtime-ios";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
microsoft-net-runtime-ios-net6-7_0_2 = rec {
  pname = "microsoft-net-runtime-ios-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "microsoft-net-runtime-ios-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
microsoft-net-runtime-maccatalyst-7_0_2 = rec {
  pname = "microsoft-net-runtime-maccatalyst-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "microsoft-net-runtime-maccatalyst";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
microsoft-net-runtime-maccatalyst-net6-7_0_2 = rec {
  pname = "microsoft-net-runtime-maccatalyst-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "microsoft-net-runtime-maccatalyst-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
microsoft-net-runtime-macos-7_0_2 = rec {
  pname = "microsoft-net-runtime-macos-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "microsoft-net-runtime-macos";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
microsoft-net-runtime-macos-net6-7_0_2 = rec {
  pname = "microsoft-net-runtime-macos-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "microsoft-net-runtime-macos-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
microsoft-net-runtime-mono-tooling-7_0_2 = rec {
  pname = "microsoft-net-runtime-mono-tooling-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "microsoft-net-runtime-mono-tooling";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
microsoft-net-runtime-mono-tooling-net6-7_0_2 = rec {
  pname = "microsoft-net-runtime-mono-tooling-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "microsoft-net-runtime-mono-tooling-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
microsoft-net-runtime-tvos-7_0_2 = rec {
  pname = "microsoft-net-runtime-tvos-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "microsoft-net-runtime-tvos";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
microsoft-net-runtime-tvos-net6-7_0_2 = rec {
  pname = "microsoft-net-runtime-tvos-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "microsoft-net-runtime-tvos-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
microsoft-net-sdk-emscripten-net6-7_0_2 = rec {
  pname = "microsoft-net-sdk-emscripten-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.emscripten.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-0crjxWwqOXn+8ll3si1kj2gPXk5JNY/K2I1d3bDvLbg=";
  };
  workloadName = "microsoft-net-sdk-emscripten-net6";
  nugetName = "microsoft.net.workload.emscripten.net6";
  workloadPacks = [
    
    Microsoft_NET_Runtime_Emscripten_Node_net6
    Microsoft_NET_Runtime_Emscripten_Python_net6
    Microsoft_NET_Runtime_Emscripten_Sdk_net6
  ];
};
microsoft-net-sdk-emscripten-net7-7_0_2 = rec {
  pname = "microsoft-net-sdk-emscripten-net7-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.emscripten.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-HXWOzgi0Ci06dwp+ekWo8+mh8+Rgbe/dSViit3w4bM4=";
  };
  workloadName = "microsoft-net-sdk-emscripten-net7";
  nugetName = "microsoft.net.workload.emscripten.net7";
  workloadPacks = [
    
    Microsoft_NET_Runtime_Emscripten_Cache_net7
    Microsoft_NET_Runtime_Emscripten_Node_net7
    Microsoft_NET_Runtime_Emscripten_Python_net7
    Microsoft_NET_Runtime_Emscripten_Sdk_net7
  ];
};
runtimes-ios-7_0_2 = rec {
  pname = "runtimes-ios-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "runtimes-ios";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
runtimes-ios-net6-7_0_2 = rec {
  pname = "runtimes-ios-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "runtimes-ios-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
runtimes-maccatalyst-7_0_2 = rec {
  pname = "runtimes-maccatalyst-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "runtimes-maccatalyst";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
runtimes-maccatalyst-net6-7_0_2 = rec {
  pname = "runtimes-maccatalyst-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "runtimes-maccatalyst-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
runtimes-tvos-7_0_2 = rec {
  pname = "runtimes-tvos-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "runtimes-tvos";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
runtimes-tvos-net6-7_0_2 = rec {
  pname = "runtimes-tvos-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "runtimes-tvos-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
runtimes-windows-7_0_2 = rec {
  pname = "runtimes-windows-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "runtimes-windows";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
runtimes-windows-net6-7_0_2 = rec {
  pname = "runtimes-windows-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "runtimes-windows-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
tvos-16_1_1504 = rec {
  pname = "tvos-16_1_1504";
  version = "16.1.1504";
  src = fetchNuGet {
    pname = "microsoft.net.sdk.tvos.manifest-7.0.100";
    inherit version;
    hash = "sha256-FMn/si9QHCCc7cabb/wJMXlluxS6eVpn4LLSghCcitg=";
  };
  workloadName = "tvos";
  nugetName = "microsoft.net.sdk.tvos";
  workloadPacks = [
    Microsoft_tvOS_Ref-16_1_1504
    Microsoft_tvOS_Runtime_tvos-arm64-16_1_1504
    Microsoft_tvOS_Runtime_tvossimulator-arm64-16_1_1504
    Microsoft_tvOS_Runtime_tvossimulator-x64-16_1_1504
    Microsoft_tvOS_Sdk_net6
    Microsoft_tvOS_Sdk_net7
    Microsoft_tvOS_Templates_net7
  ];
};
wasm-experimental-7_0_2 = rec {
  pname = "wasm-experimental-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "wasm-experimental";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
wasm-tools-7_0_2 = rec {
  pname = "wasm-tools-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net7.manifest-7.0.100";
    inherit version;
    hash = "sha256-lh9kePz6+p5ZpxQ8jugqd92IpL0gxatt8FHL5NDKiRE=";
  };
  workloadName = "wasm-tools";
  nugetName = "microsoft.net.workload.mono.toolchain.net7";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm
    Microsoft_NETCore_App_Runtime_net7_osx-arm64
    Microsoft_NETCore_App_Runtime_net7_osx-x64
    Microsoft_NETCore_App_Runtime_net7_win-arm
    Microsoft_NETCore_App_Runtime_net7_win-arm64
    Microsoft_NETCore_App_Runtime_net7_win-x64
    Microsoft_NETCore_App_Runtime_net7_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7
    Microsoft_NET_Runtime_MonoTargets_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Sdk_net7
    Microsoft_NET_Runtime_WebAssembly_Templates_net7
  ];
};
wasm-tools-net6-7_0_2 = rec {
  pname = "wasm-tools-net6-7_0_2";
  version = "7.0.2";
  src = fetchNuGet {
    pname = "microsoft.net.workload.mono.toolchain.net6.manifest-7.0.100";
    inherit version;
    hash = "sha256-j7e5/DOvCxUwrDO3VB7HHBV8nFq67llIKzUvwGPTs1I=";
  };
  workloadName = "wasm-tools-net6";
  nugetName = "microsoft.net.workload.mono.toolchain.net6";
  workloadPacks = [
    
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_android-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm
    Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64
    Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64
    Microsoft_NETCore_App_Runtime_net6_osx-arm64
    Microsoft_NETCore_App_Runtime_net6_osx-x64
    Microsoft_NETCore_App_Runtime_net6_win-arm
    Microsoft_NETCore_App_Runtime_net6_win-arm64
    Microsoft_NETCore_App_Runtime_net6_win-x64
    Microsoft_NETCore_App_Runtime_net6_win-x86
    Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6
    Microsoft_NET_Runtime_MonoTargets_Sdk_net6
    Microsoft_NET_Runtime_WebAssembly_Sdk_net6
  ];
};
Microsoft_Android_Ref_33-33_0_26 = buildDotnetPack rec {
  pname = "Microsoft.Android.Ref.33";
  version = "33.0.26";
  originalKey = "Microsoft.Android.Ref.33";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Uk42gnfF9jCdyKqVPIWPA0aWFpXLJFErgN+ITJE29G0=";
  };
};
Microsoft_Android_Runtime_33_android-arm-33_0_26 = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.33.android-arm";
  version = "33.0.26";
  originalKey = "Microsoft.Android.Runtime.33.android-arm";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-+gcADz+jnJqJzHrCFktfAIHRmB23aeJgMKCxFrLpnb0=";
  };
};
Microsoft_Android_Runtime_33_android-arm64-33_0_26 = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.33.android-arm64";
  version = "33.0.26";
  originalKey = "Microsoft.Android.Runtime.33.android-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-/hvEDqUTWUSDxwisPnWL8525pHmnWImsTIUW8VD4+NI=";
  };
};
Microsoft_Android_Runtime_33_android-x64-33_0_26 = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.33.android-x64";
  version = "33.0.26";
  originalKey = "Microsoft.Android.Runtime.33.android-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-HVbfIq7RoBHkncNIxu3IC9iPAe/6DaB/zIZc8m5DYb0=";
  };
};
Microsoft_Android_Runtime_33_android-x86-33_0_26 = buildDotnetPack rec {
  pname = "Microsoft.Android.Runtime.33.android-x86";
  version = "33.0.26";
  originalKey = "Microsoft.Android.Runtime.33.android-x86";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Dmhc/vjKpfUS7I5r39fqC8lwC851StIS9annSNNJW5s=";
  };
};
Microsoft_Android_Sdk_Darwin-32_0_485 = buildDotnetPack rec {
  pname = "Microsoft.Android.Sdk.Darwin";
  version = "32.0.485";
  originalKey = "Microsoft.Android.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-iYAKFwMSkMlqlOpsyigoWPpMWM5kTC0R0ZA8B0fHpPM=";
  };
};
Microsoft_Android_Sdk_Darwin-33_0_26 = buildDotnetPack rec {
  pname = "Microsoft.Android.Sdk.Darwin";
  version = "33.0.26";
  originalKey = "Microsoft.Android.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-T/fzQh80XtShPGvFHFKNWdW2HTq1DfFV8yRT13JpEAE=";
  };
};
Microsoft_Android_Sdk_Linux-32_0_485 = buildDotnetPack rec {
  pname = "Microsoft.Android.Sdk.Linux";
  version = "32.0.485";
  originalKey = "Microsoft.Android.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-I+VqSw7BSgLFf8EAjhHRujpye6VpqtX0hH78fC4qmak=";
  };
};
Microsoft_Android_Sdk_Linux-33_0_26 = buildDotnetPack rec {
  pname = "Microsoft.Android.Sdk.Linux";
  version = "33.0.26";
  originalKey = "Microsoft.Android.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-RTQ3vTrydMV/daUa7pZ9IirHpoxW93RRn436S+EyaRE=";
  };
};
Microsoft_Android_Sdk_Windows-32_0_485 = buildDotnetPack rec {
  pname = "Microsoft.Android.Sdk.Windows";
  version = "32.0.485";
  originalKey = "Microsoft.Android.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-V6Eegy4NUkM+T/9ZPtpd2AVtzIyu3HGgjmcjYqmAkTU=";
  };
};
Microsoft_Android_Sdk_Windows-33_0_26 = buildDotnetPack rec {
  pname = "Microsoft.Android.Sdk.Windows";
  version = "33.0.26";
  originalKey = "Microsoft.Android.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Ol/+o/p2vDQ72vJUVEbIddc6kCf64Hza5nrnjFIzenk=";
  };
};
Microsoft_Android_Templates-33_0_26 = buildDotnetPack rec {
  pname = "Microsoft.Android.Templates";
  version = "33.0.26";
  originalKey = "Microsoft.Android.Templates";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-YuAgoq1aTnpkHu4ogOwsq7JSeWRhE6DoE0v+MVznhaI=";
  };
};
Microsoft_AspNetCore_Components_WebView_Maui-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.AspNetCore.Components.WebView.Maui";
  version = "7.0.58";
  originalKey = "Microsoft.AspNetCore.Components.WebView.Maui";
  kind = "library";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-EbMIwUYc+rSdHjvcFYlNalR9meSFW6G7X53YU+l/ZI0=";
  };
};
Microsoft_MacCatalyst_Ref-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.MacCatalyst.Ref";
  version = "16.2.1007";
  originalKey = "Microsoft.MacCatalyst.Ref";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-R+ucCL0MFiAOxHRY7N0SxPqBIuJ3uSp9E+10rHV2oyg=";
  };
};
Microsoft_MacCatalyst_Runtime_maccatalyst-arm64-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.MacCatalyst.Runtime.maccatalyst-arm64";
  version = "16.2.1007";
  originalKey = "Microsoft.MacCatalyst.Runtime.maccatalyst-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-W4dmZivGiLxSJc232vjRwD8eDnclBn6VofBebnV1p00=";
  };
};
Microsoft_MacCatalyst_Runtime_maccatalyst-x64-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.MacCatalyst.Runtime.maccatalyst-x64";
  version = "16.2.1007";
  originalKey = "Microsoft.MacCatalyst.Runtime.maccatalyst-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-imLMkoBOxh+XeXakrAUqoxS6TNkpiop4qgv9GTdvfgA=";
  };
};
Microsoft_MacCatalyst_Sdk-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.MacCatalyst.Sdk";
  version = "16.2.1007";
  originalKey = "Microsoft.MacCatalyst.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-BXqhn1iirSXVRTJ9rwtrGkBBhfZrj5n8s1sDkmTyOf4=";
  };
};
Microsoft_MacCatalyst_Sdk-16_2_3 = buildDotnetPack rec {
  pname = "Microsoft.MacCatalyst.Sdk";
  version = "16.2.3";
  originalKey = "Microsoft.MacCatalyst.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-fwZTqAvliFRa8jqzYZvQ7ur+1H/6ZCrlLfRPxNNEmhY=";
  };
};
Microsoft_MacCatalyst_Templates-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.MacCatalyst.Templates";
  version = "16.2.1007";
  originalKey = "Microsoft.MacCatalyst.Templates.net7";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-juTU7c9X+umaa7jXy4r2zi0wal3QtI+IIpprMaX3cp4=";
  };
};
Microsoft_Maui_Controls_Ref_android-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.android";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Ref.android";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-+NT54JNL13gDRqN6hz1sgQLCB4vjdvtSe/1qukk/kpA=";
  };
};
Microsoft_Maui_Controls_Ref_any-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.any";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Ref.any";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-mDAiWKtTUONEPwbCPCUPxAPmHuZFfDqfxGWcoI/JU4c=";
  };
};
Microsoft_Maui_Controls_Ref_ios-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.ios";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Ref.ios";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-750OQswYClUpaaTbCdlzZJej+x5wGL8eFFHJd/i4lgc=";
  };
};
Microsoft_Maui_Controls_Ref_maccatalyst-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.maccatalyst";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Ref.maccatalyst";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-BGh31szkc3q6C0tg3LV2kxKb/EwJs1ZKOYmACChsg9g=";
  };
};
Microsoft_Maui_Controls_Ref_tizen-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.tizen";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Ref.tizen";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-k9lWKGTNidn2FfIkRPDcMqCO7RhWu/ZE1AOJaIowwrM=";
  };
};
Microsoft_Maui_Controls_Ref_win-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Ref.win";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Ref.win";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-flDHkUF7muDeOrnNlxHY1jbpSyiWZzA0nLmOhmxfumY=";
  };
};
Microsoft_Maui_Controls_Runtime_android-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.android";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Runtime.android";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-ChBYJipt2Pg4aWw5J2dMywetlu3vGCLyckbNrQCvOHQ=";
  };
};
Microsoft_Maui_Controls_Runtime_any-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.any";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Runtime.any";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-V6sonmoRSy8LcgZ+ZRSlI/iCnPz5S8wgWfHXzPk2LmE=";
  };
};
Microsoft_Maui_Controls_Runtime_ios-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.ios";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Runtime.ios";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-8GJLB0u53Y2MY3W+NqXBhzb2OpQyRtDFsCPayF0j5Nc=";
  };
};
Microsoft_Maui_Controls_Runtime_maccatalyst-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.maccatalyst";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Runtime.maccatalyst";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-oboCo3ELk4KSHGELc6lg7hD6v0ZBpm4sSfv1mFCxDdc=";
  };
};
Microsoft_Maui_Controls_Runtime_tizen-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.tizen";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Runtime.tizen";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-mqSaXLSwD7PEAzrdvssoIB+12djDK3s0lfOZ921/m2s=";
  };
};
Microsoft_Maui_Controls_Runtime_win-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Controls.Runtime.win";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Controls.Runtime.win";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-nzEhsFExAxfgT7S3R35kUmQPLStO6IEBRAiF/p3Bkj8=";
  };
};
Microsoft_Maui_Core_Ref_android-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.android";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Ref.android";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-/UmJuqhF1LGoZ4swWutR9mZ9nV7+oF9eQmdbVVNp4jM=";
  };
};
Microsoft_Maui_Core_Ref_any-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.any";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Ref.any";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-qmBRTbvfQ9Zh83YmV/UY+7wcouq26zmy3mnKl1S3EJs=";
  };
};
Microsoft_Maui_Core_Ref_ios-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.ios";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Ref.ios";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-GmkT3xelsl3pK0YtvbBElZtdtRzzPWJp3YiHWmpRj+M=";
  };
};
Microsoft_Maui_Core_Ref_maccatalyst-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.maccatalyst";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Ref.maccatalyst";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-vr1+LSgHJs7uF4MHFkL3G9ffzi1cVmINa6G5Wt/3dIc=";
  };
};
Microsoft_Maui_Core_Ref_tizen-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.tizen";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Ref.tizen";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-BYiajUWfbh5Z2Gj/sPjIOpGsoVUPo9MPIWqJ2I+3VI4=";
  };
};
Microsoft_Maui_Core_Ref_win-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Ref.win";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Ref.win";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-HVOYXpQxUOtbOQPKwCZb0Hw+qOK/BZRQU/mT8u7Jd0I=";
  };
};
Microsoft_Maui_Core_Runtime_android-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.android";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Runtime.android";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-kyLEioc+4Zj3siJMTdLPFYgoCZSZcZHdn0v7WiUaMzw=";
  };
};
Microsoft_Maui_Core_Runtime_any-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.any";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Runtime.any";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-RixMLMy86ZNolAGg6yi7tHsBI8WStxqZUaC9aXPdLj0=";
  };
};
Microsoft_Maui_Core_Runtime_ios-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.ios";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Runtime.ios";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-TdBKl21za4M1Mr6GvID28SmMAw5DhvvveFTGDhnKnBo=";
  };
};
Microsoft_Maui_Core_Runtime_maccatalyst-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.maccatalyst";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Runtime.maccatalyst";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-p2K6geTwDTSXeMlPBoeScgBjLPRotPN/pCkNTp2Ma9s=";
  };
};
Microsoft_Maui_Core_Runtime_tizen-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.tizen";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Runtime.tizen";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-A20PmpyQkXCmEGdO3c/dByNOQOt1c9nAln5+e3nI0KE=";
  };
};
Microsoft_Maui_Core_Runtime_win-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Core.Runtime.win";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Core.Runtime.win";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-CIz2xcR0S+BQ+JH8nhmmPCRDcHtRy58ME4LgA7+QQEU=";
  };
};
Microsoft_Maui_Essentials_Ref_android-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.android";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Ref.android";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-NEkuOW9Tfxm9Zl8S/uNIFnLlDnYFHIUVaOLDwHC60eM=";
  };
};
Microsoft_Maui_Essentials_Ref_any-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.any";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Ref.any";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-8umfVDMC1UwsChdnlTk9WEjYjbycQ2PsbNrKnXdVPXk=";
  };
};
Microsoft_Maui_Essentials_Ref_ios-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.ios";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Ref.ios";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-A8ssr3KMgAjdhqFp46sgrVvqGrvJYA76XmxdJff8tuw=";
  };
};
Microsoft_Maui_Essentials_Ref_maccatalyst-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.maccatalyst";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Ref.maccatalyst";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-0uee0L7pG9DNI/o7PLwUi5sMdVHOCwTasxmWn6KNk0w=";
  };
};
Microsoft_Maui_Essentials_Ref_tizen-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.tizen";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Ref.tizen";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-tfwFFGnwl2KPRWYepwh3PG02IX2mTXI6C/sKfQ8ymjg=";
  };
};
Microsoft_Maui_Essentials_Ref_win-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Ref.win";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Ref.win";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-oP6X4RkHmYEH58vWbEXlTxZ57WJndmU77pRt09NzkBU=";
  };
};
Microsoft_Maui_Essentials_Runtime_android-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.android";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Runtime.android";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-jVlKzs8Ogwa1O6mVUyQ7N/96REWagwZ3QlMEOjNQgyU=";
  };
};
Microsoft_Maui_Essentials_Runtime_any-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.any";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Runtime.any";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-V3oad2y2A76JGhJmV5v8u8nSVL4iD4hs0pIvStnP9WE=";
  };
};
Microsoft_Maui_Essentials_Runtime_ios-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.ios";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Runtime.ios";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-tuGBOZ1JsVtyXjTSWxQO/CtM/t4TxcFpljxWFOwgaJ0=";
  };
};
Microsoft_Maui_Essentials_Runtime_maccatalyst-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.maccatalyst";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Runtime.maccatalyst";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-JbOUVqgtGVYBBKMdd2sA7BAgQb+dk2S8B6Heq+rvr+I=";
  };
};
Microsoft_Maui_Essentials_Runtime_tizen-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.tizen";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Runtime.tizen";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-nIvLt4YPiGAUlPkjJYAMkKd2/ak0DHyTBOVKYAyQqXY=";
  };
};
Microsoft_Maui_Essentials_Runtime_win-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Essentials.Runtime.win";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Essentials.Runtime.win";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-GuJ6Njl0VCmdzpVi9d2r8lFyJ7WxjjqsBmG6dcjhrqU=";
  };
};
Microsoft_Maui_Graphics-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Graphics";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Graphics";
  kind = "library";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-UVX3JIxqOuG8vcTrOBO2/L8GM8Kpmw5UNzVwXWAeYjY=";
  };
};
Microsoft_Maui_Graphics_Win2D_WinUI_Desktop-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Graphics.Win2D.WinUI.Desktop";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Graphics.Win2D.WinUI.Desktop";
  kind = "library";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-rnXPyUTwhbi2bDzRGQx1eVW4hjCyALTHa9ONcvBE7hk=";
  };
};
Microsoft_Maui_Resizetizer_Sdk-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Resizetizer.Sdk";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Resizetizer.Sdk";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-mmyiUxekdneOUNqtcRkM4SuRCfn8IQpmECJDV9XbjQU=";
  };
};
Microsoft_Maui_Sdk-6_0_550 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Sdk";
  version = "6.0.550";
  originalKey = "Microsoft.Maui.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Tik0A57Z8YB8A+jw2/GBjtw1ql7MYz9nicEnCE5HIgU=";
  };
};
Microsoft_Maui_Sdk-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Sdk";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-ilCQsrMUV/7dX5KfH5PivzwpV6pPco727ZPXhfUlIQQ=";
  };
};
Microsoft_Maui_Templates_net6-6_0_550 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Templates.net6";
  version = "6.0.550";
  originalKey = "Microsoft.Maui.Templates.net6";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-tDV4I9x5v68zq4j5sHacbfSMeVfNQWb4xwbbOYUdi9s=";
  };
};
Microsoft_Maui_Templates_net7-7_0_58 = buildDotnetPack rec {
  pname = "Microsoft.Maui.Templates.net7";
  version = "7.0.58";
  originalKey = "Microsoft.Maui.Templates.net7";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-wTxu5MHKkvde2BLA42XUUlWPziIN2QKPnHKSAOJDKng=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-arm-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-arm";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-arm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-rizCBkV8oGzCJ4b7R04g0JQYm7JDpUlma+XdM8gJ2pw=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-arm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-arm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-arm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-BPfmD4lv8KfT+3japNu0SocW9mLtVj1e+l6zDplonZg=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-sb+zCxomgoHU08SqgGltVQ8xpT5AXYC7cgARywklP64=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-su7oIiDf+HIHX5+PxPxToBrHKzBJoErvTFgCb1ldzRQ=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-61UXq8Wb1dqC70LQWTRAzhpnJNGAUDyZw43cp/31tLI=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-0kssg1noOPGzM2QBjwpwIE/OziqMNdVNi8z4TATqjxI=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-x86-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-x86";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-x86";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-vMdvBuTC9GkFEwpHrXERuNufWLG0n+UkyFXe4Y+gaOs=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-x86-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.android-x86";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-x86";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-IRKxpcEfrac9i3Km3csJaq+qWKozuN1UqsK07aoAVo8=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_browser-wasm-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.browser-wasm";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.browser-wasm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-LIzQnLAQp7OmMb9FPe78LBn7ifeqE6HpOLAg39GfbBM=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_browser-wasm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.linux-x64.Cross.browser-wasm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.browser-wasm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-H6jqB1E+ARH91JUcfkcZJ/y3UClc5+wR4UxHlWuN/Nw=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-arm";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-arm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-+3uXMLGEPyCDfm2YUzv97NqgrSSv/t2s1fZfZAhpe0s=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-arm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-arm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-CgG2Z1l//WSVP+Lvx5i1f+dEqy/XVvE6fqmHO0IyQr4=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-t9y6ZVZwcyEU8s6o1+ezKYTomxbfRo5e17+6Z8ZJSFE=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-560fRdntwtQo4VOrXsxDkR6Wnh7Qk+x3hSngKykfgGw=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-eykR//ygYeKkplclv5EcV/5zeRg7XJFH/LOQ+eaZWko=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-RLtEBh71/xFKFGH8H+IhQEQNJUL0PYmgwlOh47y1/C8=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x86-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-x86";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-x86";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-QBlr+yQIyIkZNNcf2yTngCBXhww2FuvaDCKmo4mxGh4=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x86-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.android-x86";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-x86";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-gPCk57wZ8uh557qbfgIqgAOZqEd+AmbHtIiAFKKdOtM=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_browser-wasm-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.browser-wasm";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.browser-wasm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-YDAEdfpShO4DkYFhKc4Yca9Ekqxf8JY5VBVAH364vHU=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_browser-wasm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.browser-wasm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.browser-wasm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-U8DNEt/mBlS1uHEfAbdfn956KYdtsTMAwZvDR1wLD5s=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.ios-arm";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.ios-arm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-0CoAz5pLzOIndzuCPaYOmebZgd05qUVU8SrSpSWIekw=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.ios-arm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.ios-arm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-lJ3QLndQX7GkDQ0hcMY62zH0cPgK0w6g1Ao6b89TYvk=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.ios-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.ios-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-WE4c0pF0awnvddTRN58bSzH+79S+K4NLaaktjmYFn4c=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.ios-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.ios-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-xDbvYE2qX34dvXVx491YKOxlsaYg5WyfpvaVONzdeY0=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.iossimulator-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.iossimulator-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-5tr2jgsBcY8BP8mrfcacLFMfM9nVT67NEF1feYN4VZ0=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.iossimulator-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.iossimulator-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-r1xD8QGXhZpRN/MFNGJxKfv3gmXu/yFdPl4xicGUYuc=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.iossimulator-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.iossimulator-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-5WSeRtRne3x+l4oXyTzccve5/dxkxzKiu03hRdDWjRI=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.iossimulator-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.iossimulator-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-mXTZet43P+IY4OOmAdnw1oMJf3d0dKA87PmDFbQf5Y4=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x86-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.iossimulator-x86";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.iossimulator-x86";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-aIsn0b2HJbk3ufInLaB1amhILR7/FDfaBuNWVEUkz90=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x86-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.iossimulator-x86";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.iossimulator-x86";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-9fK++BPoG1UMQFCVLQpX4bmgef/6s2TVkJtYqa+ULTw=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.maccatalyst-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.maccatalyst-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Lf7uNYkbh7KCWFfy7uUv1mZlS8quQEZ5uI34EU9wDNc=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.maccatalyst-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.maccatalyst-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-3hRNN7DtBK87RgIoqrmKWvMRXYHoG64SslGurOnx9w4=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.maccatalyst-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.maccatalyst-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-M/bbosgdTaeE/MgYs35Trv5qZWFYjMhMNjx9XDXw+7w=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.maccatalyst-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.maccatalyst-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-TSWGc2jsQfL2jowKNUV+qPHel8/qDxv2WKBCNr/YLLM=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvos-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.tvos-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.tvos-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-qrwFUO5EThJibx0m3c/YN23kaTvWiaLdWlRCXFEgVBg=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvos-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.tvos-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.tvos-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-xpQFixWd33i/JmVj5ZH5GPE+HCXcfO06edJJwxLGGaY=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.tvossimulator-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.tvossimulator-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-hOxYqK3YXwe2ZsV6cWoYkvMbQ5bmQ9Ddz1R/Xh6kVAY=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.tvossimulator-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.tvossimulator-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-EvcheYtUszK+5gQ42+YuOrrCj7Juh2MyQFF7TTRDLLQ=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.tvossimulator-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.tvossimulator-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-HkZDGIuf5FG67MfQZ+38MU27U2Jovvg2uK5WoQKxR1o=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.osx-x64.Cross.tvossimulator-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.tvossimulator-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-0ASjQppZeMzPhaqrV4jHWrBWrS+AUcVOtmNwlAP1700=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-arm";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-arm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-c+++1mgIO+XBaMR9z435Dik/ISWqqQMrwB857VObkVc=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-arm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-arm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-4MpEv2Ywe4Ve3hhg73ymqrr567TGSqv+enXcYHHXa3c=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-7zupGAlWxkGBMX50Nme8gMBzn+zpAyHu3eqOv2wzlS8=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-arm64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-NSRkxa7+N0PXmOUV+RJ5nNyyq7x1VRErplw/palOl78=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-upZ3o0ZTFHCAM+8jNzYwm0MSkcJsDNuWtp2EhzLZzcc=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-x64";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-ZSOfsVxpChRrwR/VyKb/UoWsCCwDTyrjC6TVdjV/1wI=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x86-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-x86";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.android-x86";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-/Q9oRry8U1crwjzbW20GgC+29/w1Km3/4mXtl2Gi3mA=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x86-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.android-x86";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.android-x86";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-RmWUZGgFNRhURBvQJ1PczF3RgJTF9JCPM62UYo222EU=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_browser-wasm-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.browser-wasm";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net6.browser-wasm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-pkqn3YTgW64ICb5Ak28nDLJ0PJ/pHFu494E0Asz4e9o=";
  };
};
Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_browser-wasm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.AOT.win-x64.Cross.browser-wasm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.AOT.Cross.net7.browser-wasm";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-i0Yl2sc/KOI1eFkst3widU7HrmeAKsHNr1o4YFrdhig=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_android-arm-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.android-arm";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.android-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-vctTdd9jo8LDKaHCcGvLofWXLbqYmR4mTaugiyx017g=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_android-arm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.android-arm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.android-arm";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-L4SX8s9tITXcNBY1ND51y7FrNZ1wYmqbC1ETG7bnNo4=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_android-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.android-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.android-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-UlqEkLb2om+eSv83WxhdYs88Zxc0q8L0GKjGLuQvlrA=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_android-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.android-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.android-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-jvoPT0M5uh1WClr/z5xT8h3NXuSCs4dM4PSA/ppnrNg=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_android-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.android-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.android-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-loxw91SmqK2PTTM8tuZx04mrf+fmNdVZplCsVXigiJo=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_android-x86-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.android-x86";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.android-x86";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Yad29l5r72TGSfWTvlQsAbyb3aZdhcaUf2Y0VKSQXIQ=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_android-x86-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.android-x86";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.android-x86";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-4GVITd02R1EVnPzdtp/xGFZRXZ+OjQdblIcyzPBHPFo=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_browser-wasm-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.browser-wasm";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.browser-wasm";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-ZWY0kK/i3Q/hPV9Pn9rJ3tzOg60KzRK0mVg9NraKLK8=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_browser-wasm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.browser-wasm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.browser-wasm";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-OcyXkhBz54NvUpJ9eBe/IvBksuEkpX8bGXRd9EL4+HE=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_ios-arm-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.ios-arm";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.ios-arm";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-yWjK0ZCUyoRvTqErhFoLwd5cldxHIWKP0yguxY2y06s=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_ios-arm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.ios-arm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.ios-arm";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-EC9QS5eQ3ioJ2cKG6v4mtrHv/3A4D72tXQmRG9qDagc=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_ios-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.ios-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.ios-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Yu0BBfyFjgjX8nsS0U+BOIU1t3oTfVkmBCiBBpdTi8I=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_ios-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.ios-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.ios-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-dr8Rh9vlMoL4AgQCKUujUNbDmZ0EUC1axDPVSeLVh7E=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_iossimulator-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.iossimulator-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.iossimulator-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-0UWE8yJTjasGXk20L/om9TCmRl75uy+6XCtgq5Qg9L0=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_iossimulator-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.iossimulator-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.iossimulator-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-fm4+zp6E7pfQ1dztfSgPCIX9RjAuLoXvJYk9+3eORyw=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_iossimulator-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.iossimulator-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.iossimulator-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Bxs7g/eNN/1+iiyVuTBlQjchXHV7fQz9OnfuCbyE7/0=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_iossimulator-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.iossimulator-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.iossimulator-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-WoFsVTYo6iz/sdgPk4SHVSWblO3UV85l3RqlSCfjimE=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_iossimulator-x86-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.iossimulator-x86";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.iossimulator-x86";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-B4/4+ghz7Klj7wptbMyvUKooDgaqxO0JyOVu/BkGKHA=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_iossimulator-x86-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.iossimulator-x86";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.iossimulator-x86";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Yr3a/Z79Upst84LVgWlZzZpsBTEZpp+Vce/LlDoYbN8=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_maccatalyst-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.maccatalyst-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.maccatalyst-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-KXwGl0G0DSsYQcf3oNa6YbFQiBrad0ah1fmlMtrRIKM=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_maccatalyst-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.maccatalyst-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.maccatalyst-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-7i3IziwFs6jiyGX2F9goJTVMbsDTvae5jzoJSVimEes=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_maccatalyst-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.maccatalyst-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.maccatalyst-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-fCW0nF3/XQFkI7+SnIDzpiLs7L6NKVLbvY31wlaFXLY=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_maccatalyst-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.maccatalyst-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.maccatalyst-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-FBvyBr1asOIsQT5oLSGS7Eg6lSDxOEzQcSStZE7wlmw=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_multithread_browser-wasm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.multithread.browser-wasm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.multithread.net7.browser-wasm";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-RW0Mc26+7BjMtulZO7SwbI2nTeVN2YCJL/WRwV6HAuQ=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_osx-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.osx-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.net6.osx-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-moerkhwMjxLFdp+AC2aMoHERBHzNM53GeHXeulXn+EY=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_osx-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.osx-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.net7.osx-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-caKZWJv1yhpaGwccTRuZcT9oCRMAIT8BBqAZpARnSmU=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_osx-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.osx-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.osx-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-yXnhTh2Au+YY8ML5n9nORws04xmlxJk9SH4E+GBzkP0=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_osx-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.osx-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.osx-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-CcGpVOnRcW+Oo7Yr8zUPu+Ffmc0miTdzQsa33g5lp5M=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_perftrace_browser-wasm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.perftrace.browser-wasm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.perftrace.net7.browser-wasm";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-C6vueFh34qD83MyRwYVh1VP63KTCJJ8nC8kEYuqwmoo=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_tvos-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.tvos-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.tvos-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-794N31HPAuE78NVLETiFeOsom70oGK/YAKu+rDKSf1M=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_tvos-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.tvos-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.tvos-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-kknvT3vs4/koRPjsRqBe2cdiqBNi8UXihDCt6T7W6kI=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_tvossimulator-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.tvossimulator-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.tvossimulator-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-sq7glsZzRKi2GuzW7qBYv4hpKyG9Qx5B+PRb90r9kPc=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_tvossimulator-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.tvossimulator-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.tvossimulator-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-WGIkfNRZ64cAVS7ITuyg86tydIpHlt3YSqMwBDi5HPA=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_tvossimulator-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.tvossimulator-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net6.tvossimulator-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-HJAokASeKLsdeTSgAfkJPaF5ju1U78vpTmXbKv9lyY8=";
  };
};
Microsoft_NETCore_App_Runtime_Mono_tvossimulator-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.Mono.tvossimulator-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.Mono.net7.tvossimulator-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-MmesesC3l6q9BjaAYoPwfpcp6J1lutPkYTboeclWYnM=";
  };
};
Microsoft_NETCore_App_Runtime_osx-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.osx-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.net6.osx-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Ljj1/AI4ybr4FYGQFiNxPkfy4EAdjEcCVXoEsV4ZAus=";
  };
};
Microsoft_NETCore_App_Runtime_osx-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.osx-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.net7.osx-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-oaMo4rjnyhYDQ18GGIQ+DdI6iTK+5NwYOKFZFdFa2kA=";
  };
};
Microsoft_NETCore_App_Runtime_win-arm-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-arm";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.net6.win-arm";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-RSeB76MM2avwvvyPHtHyGKTpNxIQLprL1wRI866OzyY=";
  };
};
Microsoft_NETCore_App_Runtime_win-arm-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-arm";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.net7.win-arm";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-QT+iyANie7/s28LMGnbqTNHfAh8HmPAdNOGiKlZwrYE=";
  };
};
Microsoft_NETCore_App_Runtime_win-arm64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-arm64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.net6.win-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-74fMv3LRrxjGozfq1hTIeCINEzyelBF8BC+eOkLYDgo=";
  };
};
Microsoft_NETCore_App_Runtime_win-arm64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-arm64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.net7.win-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Yw/GQTwUpAZUxeE1hYVadhIPIq/HER8pE6WmoE+XPnw=";
  };
};
Microsoft_NETCore_App_Runtime_win-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.net6.win-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-i82VE4j3eOXxOk/SgtGlFc04EnLllHyOzlraMeMLi/E=";
  };
};
Microsoft_NETCore_App_Runtime_win-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.net7.win-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-YoIGTrxESiPJqM9Ctl+D3UnvV7J+oPC/o7GXYezcxNE=";
  };
};
Microsoft_NETCore_App_Runtime_win-x86-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-x86";
  version = "6.0.13";
  originalKey = "Microsoft.NETCore.App.Runtime.net6.win-x86";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-1sfT4vNth1DeOYGFhP6sk7PJaSJ3eqvuSnkglyEepEw=";
  };
};
Microsoft_NETCore_App_Runtime_win-x86-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NETCore.App.Runtime.win-x86";
  version = "7.0.2";
  originalKey = "Microsoft.NETCore.App.Runtime.net7.win-x86";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-hPV18/SGtJmrntpI89F0g0Em2jJO0Zl+f3Z+q7qtvMg=";
  };
};
Microsoft_NET_Runtime_Emscripten_2_0_23_Node_linux-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.2.0.23.Node.linux-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Node.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-u4A7w176C8uz/pTFYbYsfqQtkBhGjUcSeWU5OV5IGhc=";
  };
};
Microsoft_NET_Runtime_Emscripten_2_0_23_Node_osx-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.2.0.23.Node.osx-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Node.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-IMiX3upt8akBaqZybUjHPTNaTZTs8yDsuINCRmdYibQ=";
  };
};
Microsoft_NET_Runtime_Emscripten_2_0_23_Node_win-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.2.0.23.Node.win-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Node.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-YJD2ienAv4wLa0R86QYzvOY793m3ETuhmV9RE1r61tk=";
  };
};
Microsoft_NET_Runtime_Emscripten_2_0_23_Python_osx-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.2.0.23.Python.osx-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Python.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-UVfw9CjhTFBR72VZdaGYontepmI9U62dqWvt0tHmqYg=";
  };
};
Microsoft_NET_Runtime_Emscripten_2_0_23_Python_win-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.2.0.23.Python.win-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Python.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-kT9ILdKO/uq2TBC9B38hqDgSMrXSkV16StJXYrpi3fo=";
  };
};
Microsoft_NET_Runtime_Emscripten_2_0_23_Sdk_linux-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.2.0.23.Sdk.linux-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-WTFJWnVys2hHdurp3uJVNUUVn+iIcqo3EBLBgcmBMI4=";
  };
};
Microsoft_NET_Runtime_Emscripten_2_0_23_Sdk_osx-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.2.0.23.Sdk.osx-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-iFKX3lY+Sz72hoNOG14QGR7qHGzqyADww+Jrs18gFGs=";
  };
};
Microsoft_NET_Runtime_Emscripten_2_0_23_Sdk_win-x64-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.2.0.23.Sdk.win-x64";
  version = "6.0.13";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-q8/QZqBX23bHKw2gHxzgLEEOv9/Nhn5hHvGxUyHYD5k=";
  };
};
Microsoft_NET_Runtime_Emscripten_3_1_12_Cache_linux-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.3.1.12.Cache.linux-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Cache.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-3VksxGQ1DWE37DZrHoawNA253dHh/xUEQqq8lFr/XB8=";
  };
};
Microsoft_NET_Runtime_Emscripten_3_1_12_Cache_osx-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.3.1.12.Cache.osx-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Cache.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Dvx/bfNHpo7zpZBBcFcgGCrIZAVeEkBYbrLuFWDDTVs=";
  };
};
Microsoft_NET_Runtime_Emscripten_3_1_12_Cache_win-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.3.1.12.Cache.win-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Cache.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-qlTrp5mTivJEJAksj3PpjKHzeZ+ZoBn4AwwHRD8abPc=";
  };
};
Microsoft_NET_Runtime_Emscripten_3_1_12_Node_linux-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.3.1.12.Node.linux-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Node.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-zmOOgyoz2gDbosKPWgipvvwYdSjhr2xQflLFx/xl0MI=";
  };
};
Microsoft_NET_Runtime_Emscripten_3_1_12_Node_osx-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.3.1.12.Node.osx-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Node.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-NYwE05iafNHk58tdk/8aOa2asX9Jvg/MDEysgbs9eUs=";
  };
};
Microsoft_NET_Runtime_Emscripten_3_1_12_Node_win-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.3.1.12.Node.win-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Node.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-dwqr7zfwsf8R6GlXnWz6rAYZPYZHijQwdqu/67H0D0M=";
  };
};
Microsoft_NET_Runtime_Emscripten_3_1_12_Python_osx-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.3.1.12.Python.osx-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Python.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-M8EjFR8REmgI3p1H6cqrah9zypl2ekfYk7uISUZu0aY=";
  };
};
Microsoft_NET_Runtime_Emscripten_3_1_12_Python_win-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.3.1.12.Python.win-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Python.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-i9TO04hXIi8u1UmFXX5JTEVRqC04XyDew8C4o9X6l0k=";
  };
};
Microsoft_NET_Runtime_Emscripten_3_1_12_Sdk_linux-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.3.1.12.Sdk.linux-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Q2eFObosFNuz0WVPmG9FPtt2rJhhEd8X22Tty7YlzIY=";
  };
};
Microsoft_NET_Runtime_Emscripten_3_1_12_Sdk_osx-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.3.1.12.Sdk.osx-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-qtHA0PZpaM05qY4jZ/rKh+ylOCm59HvCUXLtAP+SMdg=";
  };
};
Microsoft_NET_Runtime_Emscripten_3_1_12_Sdk_win-x64-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.Emscripten.3.1.12.Sdk.win-x64";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.Emscripten.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-cfCTP/tJQGpif8MHA+Zjzj33PtLikS5vd4KGf9SuNko=";
  };
};
Microsoft_NET_Runtime_MonoAOTCompiler_Task-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.MonoAOTCompiler.Task";
  version = "6.0.13";
  originalKey = "Microsoft.NET.Runtime.MonoAOTCompiler.Task.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-fQuFENyb8ae3xh2Xpl7f9hsVrhlHfdtbWRWzTqErG50=";
  };
};
Microsoft_NET_Runtime_MonoAOTCompiler_Task-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.MonoAOTCompiler.Task";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.MonoAOTCompiler.Task.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-qVnHO3Y72KEHdNIzvfY/h3abwobAz/j7pOw+EOD25dE=";
  };
};
Microsoft_NET_Runtime_MonoTargets_Sdk-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.MonoTargets.Sdk";
  version = "6.0.13";
  originalKey = "Microsoft.NET.Runtime.MonoTargets.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-IuR4oz4T7XXezrh9Q7A7yIbEDtXyQhZZRC2/ksb2TJA=";
  };
};
Microsoft_NET_Runtime_MonoTargets_Sdk-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.MonoTargets.Sdk";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.MonoTargets.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-5X35WSxi7HwFzuvWKTzGCTyjqEyyvZZm5fdRPjX3AEM=";
  };
};
Microsoft_NET_Runtime_WebAssembly_Sdk-6_0_13 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.WebAssembly.Sdk";
  version = "6.0.13";
  originalKey = "Microsoft.NET.Runtime.WebAssembly.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-aW0yLn59xLPLxydLsVCqIPp2nt8OUL30zpMnz2X9QX4=";
  };
};
Microsoft_NET_Runtime_WebAssembly_Sdk-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.WebAssembly.Sdk";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.WebAssembly.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-uDxkCl9KBuKOaoqG8wgg0Ww7WnjpToOE6AEG/p9VJc0=";
  };
};
Microsoft_NET_Runtime_WebAssembly_Templates-7_0_2 = buildDotnetPack rec {
  pname = "Microsoft.NET.Runtime.WebAssembly.Templates";
  version = "7.0.2";
  originalKey = "Microsoft.NET.Runtime.WebAssembly.Templates.net7";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-zrqe6wGvlgS4qLuZh7y/PMn92du42AqxP0t2v0w2m/A=";
  };
};
Microsoft_iOS_Ref-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Ref";
  version = "16.2.1007";
  originalKey = "Microsoft.iOS.Ref";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-OUyM8A0vigaUfUx4vL4Ik5DbH2mpfqlW7dTOg76kDp8=";
  };
};
Microsoft_iOS_Runtime_ios-arm-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Runtime.ios-arm";
  version = "16.2.1007";
  originalKey = "Microsoft.iOS.Runtime.ios-arm";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-/rNuHuaqTz8ajv/8rjToXKLuS9dwhSMtXl5O6LWTKac=";
  };
};
Microsoft_iOS_Runtime_ios-arm64-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Runtime.ios-arm64";
  version = "16.2.1007";
  originalKey = "Microsoft.iOS.Runtime.ios-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-tP6mheHoisBn3huSQg9+DdJu6VPOeqmNHLTWHJF8T30=";
  };
};
Microsoft_iOS_Runtime_iossimulator-arm64-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Runtime.iossimulator-arm64";
  version = "16.2.1007";
  originalKey = "Microsoft.iOS.Runtime.iossimulator-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-YvHZQzpWWuCKoLRXKfw92g6vHKfALnSEIfPOtDMTwYw=";
  };
};
Microsoft_iOS_Runtime_iossimulator-x64-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Runtime.iossimulator-x64";
  version = "16.2.1007";
  originalKey = "Microsoft.iOS.Runtime.iossimulator-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-/omuCoItCCMm4Iy2pvxT3VxYQ6MFvgmciNzHiCgPkgQ=";
  };
};
Microsoft_iOS_Runtime_iossimulator-x86-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Runtime.iossimulator-x86";
  version = "16.2.1007";
  originalKey = "Microsoft.iOS.Runtime.iossimulator-x86";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-eWjtj2XmuWP82JkDhleTpcSoNlrfTYWOwvkU1R4F5wc=";
  };
};
Microsoft_iOS_Sdk-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Sdk";
  version = "16.2.1007";
  originalKey = "Microsoft.iOS.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-d0gMgrywsHJ3LnShMmrilmzdeFElof6S9PI9IaiHinI=";
  };
};
Microsoft_iOS_Sdk-16_2_3 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Sdk";
  version = "16.2.3";
  originalKey = "Microsoft.iOS.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-3zaSQnmzXd7cSflWGdhxu+s3qtL0S3uKoSXTClCK+JM=";
  };
};
Microsoft_iOS_Templates-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Templates";
  version = "16.2.1007";
  originalKey = "Microsoft.iOS.Templates.net7";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-REcxYUNj/46abm65hi99jPF4OsHNaryId/57mNM7UbM=";
  };
};
Microsoft_iOS_Windows_Sdk-16_2_1007 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Windows.Sdk";
  version = "16.2.1007";
  originalKey = "Microsoft.iOS.Windows.Sdk.Aliased.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-1BgZk+p9tYI6YfKFkdhQdabyoSlaLGlnGh1Zo5hd3xo=";
  };
};
Microsoft_iOS_Windows_Sdk-16_2_3 = buildDotnetPack rec {
  pname = "Microsoft.iOS.Windows.Sdk";
  version = "16.2.3";
  originalKey = "Microsoft.iOS.Windows.Sdk.Aliased.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-DFcVIwVAvMTGP7C7NxvPXlyAZXvMeY9kVHgIluiHo5I=";
  };
};
Microsoft_macOS_Ref-13_1_1007 = buildDotnetPack rec {
  pname = "Microsoft.macOS.Ref";
  version = "13.1.1007";
  originalKey = "Microsoft.macOS.Ref";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-DJAvmdhl1vhBlHcr8LXyS/TTFv1RBvsp+F+XwYlw/j0=";
  };
};
Microsoft_macOS_Runtime_osx-arm64-13_1_1007 = buildDotnetPack rec {
  pname = "Microsoft.macOS.Runtime.osx-arm64";
  version = "13.1.1007";
  originalKey = "Microsoft.macOS.Runtime.osx-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-optXWpXu9iIXPKqVbN1gUNQx5yzne0WDCEzNtZLbhTo=";
  };
};
Microsoft_macOS_Runtime_osx-x64-13_1_1007 = buildDotnetPack rec {
  pname = "Microsoft.macOS.Runtime.osx-x64";
  version = "13.1.1007";
  originalKey = "Microsoft.macOS.Runtime.osx-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-oXUlv/ceZnmMFEuRnYU02PY8IANqb4Y+VFskedXTw0A=";
  };
};
Microsoft_macOS_Sdk-13_1_1007 = buildDotnetPack rec {
  pname = "Microsoft.macOS.Sdk";
  version = "13.1.1007";
  originalKey = "Microsoft.macOS.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-Zphr3DGRYVWcNMHUSQx2XcJjsnMeWH0awY4IVPpcn9M=";
  };
};
Microsoft_macOS_Sdk-13_1_3 = buildDotnetPack rec {
  pname = "Microsoft.macOS.Sdk";
  version = "13.1.3";
  originalKey = "Microsoft.macOS.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-h+ZKd4ne559HRTVDHcHy4VOxbve3lA3xnZnyR8efQZE=";
  };
};
Microsoft_macOS_Templates-13_1_1007 = buildDotnetPack rec {
  pname = "Microsoft.macOS.Templates";
  version = "13.1.1007";
  originalKey = "Microsoft.macOS.Templates.net7";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-FExrWIMujQowLriohVRhTFQh6KDRlC18yeamGexCm0E=";
  };
};
Microsoft_tvOS_Ref-16_1_1504 = buildDotnetPack rec {
  pname = "Microsoft.tvOS.Ref";
  version = "16.1.1504";
  originalKey = "Microsoft.tvOS.Ref";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-6G9surb7Wbj+eGmqAY4jBZSOJdE+N8mLfJ6922BkVJk=";
  };
};
Microsoft_tvOS_Runtime_tvos-arm64-16_1_1504 = buildDotnetPack rec {
  pname = "Microsoft.tvOS.Runtime.tvos-arm64";
  version = "16.1.1504";
  originalKey = "Microsoft.tvOS.Runtime.tvos-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-p3alKeC3BLqHkhDyeYZs+1dT5thNEVGxV4sw3q51lSI=";
  };
};
Microsoft_tvOS_Runtime_tvossimulator-arm64-16_1_1504 = buildDotnetPack rec {
  pname = "Microsoft.tvOS.Runtime.tvossimulator-arm64";
  version = "16.1.1504";
  originalKey = "Microsoft.tvOS.Runtime.tvossimulator-arm64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-wtrzk2bJ5pq46p992jgyyzDX9jV4mVxbZ5n/QMAtT08=";
  };
};
Microsoft_tvOS_Runtime_tvossimulator-x64-16_1_1504 = buildDotnetPack rec {
  pname = "Microsoft.tvOS.Runtime.tvossimulator-x64";
  version = "16.1.1504";
  originalKey = "Microsoft.tvOS.Runtime.tvossimulator-x64";
  kind = "framework";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-oYmixVqT+I9Fm7sHxtOG9Z4mzUV9MTdo2qYuwuBwQL0=";
  };
};
Microsoft_tvOS_Sdk-16_1_1504 = buildDotnetPack rec {
  pname = "Microsoft.tvOS.Sdk";
  version = "16.1.1504";
  originalKey = "Microsoft.tvOS.Sdk.net7";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-hEus9F5nWGoT7xFU37D3uipnx57LIgDgTOBCNTDGNm0=";
  };
};
Microsoft_tvOS_Sdk-16_1_241 = buildDotnetPack rec {
  pname = "Microsoft.tvOS.Sdk";
  version = "16.1.241";
  originalKey = "Microsoft.tvOS.Sdk.net6";
  kind = "sdk";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-9/A0krbTL5d2PHvBjtjsoEBcgIEEOoMOTZoMB3UGRsE=";
  };
};
Microsoft_tvOS_Templates-16_1_1504 = buildDotnetPack rec {
  pname = "Microsoft.tvOS.Templates";
  version = "16.1.1504";
  originalKey = "Microsoft.tvOS.Templates.net7";
  kind = "template";
  src = fetchNuGet {
    inherit pname version;
    hash = "sha256-f0WUwRx87F9pzuFgkHWqQR6mZOEgYOJVlw8f2tPauvE=";
  };
};
Microsoft_Android_Sdk_net6 = {"linux-x64" = Microsoft_Android_Sdk_Linux-32_0_485;
"osx-arm64" = Microsoft_Android_Sdk_Darwin-32_0_485;
"osx-x64" = Microsoft_Android_Sdk_Darwin-32_0_485;
"win-arm64" = Microsoft_Android_Sdk_Windows-32_0_485;
"win-x64" = Microsoft_Android_Sdk_Windows-32_0_485;
"win-x86" = Microsoft_Android_Sdk_Windows-32_0_485;};
Microsoft_Android_Sdk_net7 = {"linux-x64" = Microsoft_Android_Sdk_Linux-33_0_26;
"osx-arm64" = Microsoft_Android_Sdk_Darwin-33_0_26;
"osx-x64" = Microsoft_Android_Sdk_Darwin-33_0_26;
"win-arm64" = Microsoft_Android_Sdk_Windows-33_0_26;
"win-x64" = Microsoft_Android_Sdk_Windows-33_0_26;
"win-x86" = Microsoft_Android_Sdk_Windows-33_0_26;};
Microsoft_MacCatalyst_Sdk_net6 = {"any" = Microsoft_MacCatalyst_Sdk-16_2_3;};
Microsoft_MacCatalyst_Sdk_net7 = {"any" = Microsoft_MacCatalyst_Sdk-16_2_1007;};
Microsoft_MacCatalyst_Templates_net7 = {"any" = Microsoft_MacCatalyst_Templates-16_2_1007;};
Microsoft_Maui_Sdk_net6 = {"any" = Microsoft_Maui_Sdk-6_0_550;};
Microsoft_Maui_Sdk_net7 = {"any" = Microsoft_Maui_Sdk-7_0_58;};
Microsoft_NET_Runtime_Emscripten_Cache_net7 = {"linux-x64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Cache_linux-x64-7_0_2;
"osx-arm64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Cache_osx-x64-7_0_2;
"osx-x64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Cache_osx-x64-7_0_2;
"win-arm64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Cache_win-x64-7_0_2;
"win-x64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Cache_win-x64-7_0_2;};
Microsoft_NET_Runtime_Emscripten_Node_net6 = {"linux-x64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Node_linux-x64-6_0_13;
"osx-arm64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Node_osx-x64-6_0_13;
"osx-x64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Node_osx-x64-6_0_13;
"win-arm64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Node_win-x64-6_0_13;
"win-x64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Node_win-x64-6_0_13;};
Microsoft_NET_Runtime_Emscripten_Node_net7 = {"linux-x64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Node_linux-x64-7_0_2;
"osx-arm64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Node_osx-x64-7_0_2;
"osx-x64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Node_osx-x64-7_0_2;
"win-arm64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Node_win-x64-7_0_2;
"win-x64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Node_win-x64-7_0_2;};
Microsoft_NET_Runtime_Emscripten_Python_net6 = {"osx-arm64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Python_osx-x64-6_0_13;
"osx-x64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Python_osx-x64-6_0_13;
"win-arm64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Python_win-x64-6_0_13;
"win-x64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Python_win-x64-6_0_13;};
Microsoft_NET_Runtime_Emscripten_Python_net7 = {"osx-arm64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Python_osx-x64-7_0_2;
"osx-x64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Python_osx-x64-7_0_2;
"win-arm64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Python_win-x64-7_0_2;
"win-x64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Python_win-x64-7_0_2;};
Microsoft_NET_Runtime_Emscripten_Sdk_net6 = {"linux-x64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Sdk_linux-x64-6_0_13;
"osx-arm64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Sdk_osx-x64-6_0_13;
"osx-x64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Sdk_osx-x64-6_0_13;
"win-arm64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Sdk_win-x64-6_0_13;
"win-x64" = Microsoft_NET_Runtime_Emscripten_2_0_23_Sdk_win-x64-6_0_13;};
Microsoft_NET_Runtime_Emscripten_Sdk_net7 = {"linux-x64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Sdk_linux-x64-7_0_2;
"osx-arm64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Sdk_osx-x64-7_0_2;
"osx-x64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Sdk_osx-x64-7_0_2;
"win-arm64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Sdk_win-x64-7_0_2;
"win-x64" = Microsoft_NET_Runtime_Emscripten_3_1_12_Sdk_win-x64-7_0_2;};
Microsoft_NET_Runtime_MonoAOTCompiler_Task_net6 = {"any" = Microsoft_NET_Runtime_MonoAOTCompiler_Task-6_0_13;};
Microsoft_NET_Runtime_MonoAOTCompiler_Task_net7 = {"any" = Microsoft_NET_Runtime_MonoAOTCompiler_Task-7_0_2;};
Microsoft_NET_Runtime_MonoTargets_Sdk_net6 = {"any" = Microsoft_NET_Runtime_MonoTargets_Sdk-6_0_13;};
Microsoft_NET_Runtime_MonoTargets_Sdk_net7 = {"any" = Microsoft_NET_Runtime_MonoTargets_Sdk-7_0_2;};
Microsoft_NET_Runtime_WebAssembly_Sdk_net6 = {"any" = Microsoft_NET_Runtime_WebAssembly_Sdk-6_0_13;};
Microsoft_NET_Runtime_WebAssembly_Sdk_net7 = {"any" = Microsoft_NET_Runtime_WebAssembly_Sdk-7_0_2;};
Microsoft_NET_Runtime_WebAssembly_Templates_net7 = {"any" = Microsoft_NET_Runtime_WebAssembly_Templates-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm = {"linux-x64" = Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-arm-6_0_13;
"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm-6_0_13;
"win-arm64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm-6_0_13;
"win-x64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-arm64 = {"linux-x64" = Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-arm64-6_0_13;
"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm64-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm64-6_0_13;
"win-arm64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm64-6_0_13;
"win-x64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x64 = {"linux-x64" = Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-x64-6_0_13;
"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x64-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x64-6_0_13;
"win-arm64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x64-6_0_13;
"win-x64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x64-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_android-x86 = {"linux-x64" = Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-x86-6_0_13;
"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x86-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x86-6_0_13;
"win-arm64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x86-6_0_13;
"win-x64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x86-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_browser-wasm = {"linux-x64" = Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_browser-wasm-6_0_13;
"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_browser-wasm-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_browser-wasm-6_0_13;
"win-arm64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_browser-wasm-6_0_13;
"win-x64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_browser-wasm-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_ios-arm64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm64-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-arm64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-arm64-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x64-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x64-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_iossimulator-x86 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x86-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x86-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-arm64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-arm64-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_maccatalyst-x64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-x64-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-x64-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvos-arm64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvos-arm64-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvos-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-arm64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-arm64-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net6_tvossimulator-x64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-x64-6_0_13;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-x64-6_0_13;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm = {"linux-x64" = Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-arm-7_0_2;
"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm-7_0_2;
"win-arm64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm-7_0_2;
"win-x64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-arm64 = {"linux-x64" = Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-arm64-7_0_2;
"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm64-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-arm64-7_0_2;
"win-arm64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm64-7_0_2;
"win-x64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x64 = {"linux-x64" = Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-x64-7_0_2;
"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x64-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x64-7_0_2;
"win-arm64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x64-7_0_2;
"win-x64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x64-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_android-x86 = {"linux-x64" = Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_android-x86-7_0_2;
"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x86-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_android-x86-7_0_2;
"win-arm64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x86-7_0_2;
"win-x64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_android-x86-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_browser-wasm = {"linux-x64" = Microsoft_NETCore_App_Runtime_AOT_linux-x64_Cross_browser-wasm-7_0_2;
"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_browser-wasm-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_browser-wasm-7_0_2;
"win-arm64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_browser-wasm-7_0_2;
"win-x64" = Microsoft_NETCore_App_Runtime_AOT_win-x64_Cross_browser-wasm-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_ios-arm64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm64-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_ios-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-arm64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-arm64-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x64-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x64-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_iossimulator-x86 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x86-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_iossimulator-x86-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-arm64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-arm64-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_maccatalyst-x64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-x64-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_maccatalyst-x64-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvos-arm64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvos-arm64-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvos-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-arm64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-arm64-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_AOT_Cross_net7_tvossimulator-x64 = {"osx-arm64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-x64-7_0_2;
"osx-x64" = Microsoft_NETCore_App_Runtime_AOT_osx-x64_Cross_tvossimulator-x64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_multithread_net7_browser-wasm = {"any" = Microsoft_NETCore_App_Runtime_Mono_multithread_browser-wasm-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net6_android-arm = {"any" = Microsoft_NETCore_App_Runtime_Mono_android-arm-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_android-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_android-arm-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_android-x64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_android-x64-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_android-x86 = {"any" = Microsoft_NETCore_App_Runtime_Mono_android-x86-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_browser-wasm = {"any" = Microsoft_NETCore_App_Runtime_Mono_browser-wasm-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm = {"any" = Microsoft_NETCore_App_Runtime_Mono_ios-arm-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_ios-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_ios-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_iossimulator-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_iossimulator-x64-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_iossimulator-x86 = {"any" = Microsoft_NETCore_App_Runtime_Mono_iossimulator-x86-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_maccatalyst-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_maccatalyst-x64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_maccatalyst-x64-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_osx-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_osx-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_osx-x64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_osx-x64-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_tvos-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_tvos-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_tvossimulator-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net6_tvossimulator-x64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_tvossimulator-x64-6_0_13;};
Microsoft_NETCore_App_Runtime_Mono_net7_android-arm = {"any" = Microsoft_NETCore_App_Runtime_Mono_android-arm-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_android-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_android-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_android-x64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_android-x64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_android-x86 = {"any" = Microsoft_NETCore_App_Runtime_Mono_android-x86-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_browser-wasm = {"any" = Microsoft_NETCore_App_Runtime_Mono_browser-wasm-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm = {"any" = Microsoft_NETCore_App_Runtime_Mono_ios-arm-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_ios-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_ios-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_iossimulator-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_iossimulator-x64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_iossimulator-x86 = {"any" = Microsoft_NETCore_App_Runtime_Mono_iossimulator-x86-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_maccatalyst-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_maccatalyst-x64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_maccatalyst-x64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_osx-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_osx-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_osx-x64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_osx-x64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_tvos-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_tvos-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_tvossimulator-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_net7_tvossimulator-x64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_tvossimulator-x64-7_0_2;};
Microsoft_NETCore_App_Runtime_Mono_perftrace_net7_browser-wasm = {"any" = Microsoft_NETCore_App_Runtime_Mono_perftrace_browser-wasm-7_0_2;};
Microsoft_NETCore_App_Runtime_net6_osx-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_osx-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_net6_osx-x64 = {"any" = Microsoft_NETCore_App_Runtime_osx-x64-6_0_13;};
Microsoft_NETCore_App_Runtime_net6_win-arm = {"any" = Microsoft_NETCore_App_Runtime_win-arm-6_0_13;};
Microsoft_NETCore_App_Runtime_net6_win-arm64 = {"any" = Microsoft_NETCore_App_Runtime_win-arm64-6_0_13;};
Microsoft_NETCore_App_Runtime_net6_win-x64 = {"any" = Microsoft_NETCore_App_Runtime_win-x64-6_0_13;};
Microsoft_NETCore_App_Runtime_net6_win-x86 = {"any" = Microsoft_NETCore_App_Runtime_win-x86-6_0_13;};
Microsoft_NETCore_App_Runtime_net7_osx-arm64 = {"any" = Microsoft_NETCore_App_Runtime_Mono_osx-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_net7_osx-x64 = {"any" = Microsoft_NETCore_App_Runtime_osx-x64-7_0_2;};
Microsoft_NETCore_App_Runtime_net7_win-arm = {"any" = Microsoft_NETCore_App_Runtime_win-arm-7_0_2;};
Microsoft_NETCore_App_Runtime_net7_win-arm64 = {"any" = Microsoft_NETCore_App_Runtime_win-arm64-7_0_2;};
Microsoft_NETCore_App_Runtime_net7_win-x64 = {"any" = Microsoft_NETCore_App_Runtime_win-x64-7_0_2;};
Microsoft_NETCore_App_Runtime_net7_win-x86 = {"any" = Microsoft_NETCore_App_Runtime_win-x86-7_0_2;};
Microsoft_iOS_Sdk_net6 = {"any" = Microsoft_iOS_Sdk-16_2_3;};
Microsoft_iOS_Sdk_net7 = {"any" = Microsoft_iOS_Sdk-16_2_1007;};
Microsoft_iOS_Templates_net7 = {"any" = Microsoft_iOS_Templates-16_2_1007;};
Microsoft_iOS_Windows_Sdk_Aliased_net6 = {"win-arm64" = Microsoft_iOS_Windows_Sdk-16_2_3;
"win-x64" = Microsoft_iOS_Windows_Sdk-16_2_3;
"win-x86" = Microsoft_iOS_Windows_Sdk-16_2_3;};
Microsoft_iOS_Windows_Sdk_Aliased_net7 = {"win-arm64" = Microsoft_iOS_Windows_Sdk-16_2_1007;
"win-x64" = Microsoft_iOS_Windows_Sdk-16_2_1007;
"win-x86" = Microsoft_iOS_Windows_Sdk-16_2_1007;};
Microsoft_macOS_Sdk_net6 = {"any" = Microsoft_macOS_Sdk-13_1_3;};
Microsoft_macOS_Sdk_net7 = {"any" = Microsoft_macOS_Sdk-13_1_1007;};
Microsoft_macOS_Templates_net7 = {"any" = Microsoft_macOS_Templates-13_1_1007;};
Microsoft_tvOS_Sdk_net6 = {"any" = Microsoft_tvOS_Sdk-16_1_241;};
Microsoft_tvOS_Sdk_net7 = {"any" = Microsoft_tvOS_Sdk-16_1_1504;};
Microsoft_tvOS_Templates_net7 = {"any" = Microsoft_tvOS_Templates-16_1_1504;};
}