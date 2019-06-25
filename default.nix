{ lib, pkgs, config, ... }:

with lib;
let
  cfg = config.personal;
in
rec {
  options.personal = {
    mono = mkEnableOption "mono-5.20";
  };

  config = {
    environment.systemPackages = [
      (mkIf cfg.mono (callPackage ./modules/mono.nix {}))
    ];
  };
}
