{ lib, pkgs, ... }:
let
  callPackage = lib.callPackageWith (pkgs // self);
  self = rec {
    mono = callPackage ./mono.nix {};
    dotnet-sdk = callPackage ./dotnet-sdk.nix {};
    nuget = callPackage ./nuget.nix {};
  };
in
self
