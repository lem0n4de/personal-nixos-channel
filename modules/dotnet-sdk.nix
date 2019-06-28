{ lib, pkgs, config, options, modulesPath, ... }:

with lib;
let
  my-pkgs = pkgs.callPackage ../pkgs/all-packages.nix {};
  cfg = config.personal.dotnet;
in
rec {
  options.personal.dotnet.enable = mkEnableOption "dotnet-sdk";

  config = mkIf cfg.enable {
    environment.systemPackages = [ my-pkgs.dotnet-sdk ];
  };
}
