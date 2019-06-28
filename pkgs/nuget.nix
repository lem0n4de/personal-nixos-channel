{ pkgs, mono, buildDotnetPackage, fetchurl, ... }:

let
  version = "v5.2.0";
in
buildDotnetPackage {
  baseName = "NuGet";
  version = "v5.2.0";
  src = fetchurl {
    url = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe";
    sha256 = "16svcf7z04ylmrxz1ayaxmdpbsghs58xgkpzwz1rh4a46vkych9y";
  };
  
  buildInputs = [ mono ];
  phases = ["installPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/nuget.exe
    echo "${mono}/bin/mono $out/bin/nuget.exe" > $out/bin/nuget
    chmod +x $out/bin/nuget
  '';
  outputFiles = [ "*" ];
  dllFiles = [ "NuGet*.dll" ];
  exeFiles = ["nuget.exe"];
}
