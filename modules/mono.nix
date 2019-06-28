{ lib, pkgs, config, fetchurl, options, modulesPath }:

with lib;
let
  my-pkgs = pkgs.callPackage ../pkgs/all-packages.nix {};
  cfg = config.personal.mono;
in
rec {
  options.personal.mono.enable = mkEnableOption "mono-5.20";

  config = mkIf cfg.enable {
    environment.systemPackages = [ my-pkgs.mono ];
  };
}
    
