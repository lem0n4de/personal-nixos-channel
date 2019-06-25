{config, pkgs, lib, ...}:

rec {
  my-mono = lib.callPackage ./modules/mono.nix {};
}
