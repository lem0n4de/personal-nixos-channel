{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) callPackage;
in

rec {
  my-mono = callPackage ./modules/mono.nix {};
}
