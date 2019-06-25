{
  config ? {}, ...
}:

let
  pkgs = import <nixpkgs> {};
  inherit (pkgs) callPackage;
in
rec {
  my-mono = callPackage ./modules/mono.nix {};
}
