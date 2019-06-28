{ lib, pkgs, config, ... }:

with lib;
let
  nuget = pkgs.callPackage ../pkgs/nuget.nix {};
  cfg = config.personal.nuget;
in rec {
  options.personal.nuget.enable = mkEnableOption "NuGet package manager";
  config = mkIf cfg.enable {
    environment.systemPackages = [ nuget ];
  };
}
