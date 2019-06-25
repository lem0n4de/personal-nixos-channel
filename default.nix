{config ? {}, pkgs ? import <nixpkgs> {} , ...}:

rec {
  my-mono = lib.callPackage ./modules/mono.nix {};
}
