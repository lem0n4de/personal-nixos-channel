{ lib, pkgs, config, fetchurl, options, modulesPath }:

with lib;
let
  version = "7.8.2.1";
  monodevelop = pkgs.stdenv.mkDerivation rec {
    name = "monodevelop-${version}";
    src = pkgs.fetchurl {
      url = "https://download.mono-project.com/sources/monodevelop/monodevelop-${version}.tar.bz2";
      sha256 = "06g6j54mds69441xsch9sxga43307zwspdm8rfx291mnwz5ykkdy";
    };

    buildInputs = with pkgs; [ fsharp pkgconfig shared-mime-info (callPackage ../pkgs/mono.nix {})
                               intltool gtk-sharp-2_0 cmake libssh2
                               (callPackage ../pkgs/nuget.nix {})
                               autoconf automake
                               dotnetPackages.MonoAddins
                               dotnetPackages.NUnit
                               dotnetPackages.NUnitRunners
                             ];

    configurePhase = ''
      patchShebangs ./
      ./configure --prefix=$out
    '';

    preBuild = ''
      export HOME=/tmp
    '';
    dontStrip = true;
    
  };
  cfg = config.personal.monodevelop;
in
rec {
  options.personal.monodevelop.enable = mkEnableOption "Monodevelop";

  config = mkIf cfg.enable {
    environment.systemPackages = [ monodevelop ];
  };
}
