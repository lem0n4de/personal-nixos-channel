{ lib, pkgs, config, ... }:

with lib;
let
  cfg = config.personal;
in
rec {
  options.personal = {
    mono = mkEnableOption "mono-5.20";
  };

  config = mkIf (cfg.users != {}) {
    environment.systemPackages = environment.systemPackages ++ [
      (callPackage ./modules/mono.nix {})
    ];
  };
}
