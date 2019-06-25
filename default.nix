{ nixpkgs ? import <nixpkgs> {} }:


let
  inherit (nixpkgs) callPackage;
in
rec {
  my-mono = callPackage ./modules/mono.nix;
}
