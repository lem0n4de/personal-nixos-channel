{ config, lib, pkgs, ... }:
{
  imports = [
    ./mono.nix
    ./create_ap.nix
  ];
}
