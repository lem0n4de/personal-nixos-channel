with import <nixpkgs> {};

let
  version = "2019.1.2";
in
stdenv.mkDerivation {
  name = "jetbrains-rider-${version}";

  src = fetchurl {
    url = "https://download.jetbrains.com/rider/JetBrains.Rider-2019.1.2.tar.gz";
    sha256 = "0b0p18pcq4ml8nds4460a1ml8qjsq38kxwdrsh2ca5s194cbaapq";
  };

  
}
