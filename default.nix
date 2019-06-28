{ lib, pkgs, config, ... }:

with lib;
let
  cfg = config.personal;
in
rec {
  options.personal.enable = mkEnableOption "Enable personal channel.";
  imports = [
    ./modules/mono.nix
    ./modules/monodevelop.nix
    ./modules/nuget.nix
    ./modules/dotnet-sdk.nix
  ];
}
