with import <nixpkgs> {};

let
  version = "5.20.1.27";
in
stdenv.mkDerivation {
  name = "mono-${version}";

  src = fetchurl {
    url = "https://download.mono-project.com/sources/mono/mono-${version}.tar.bz2";
    sha256 = "15rpwxw642ad1na93k5nj7d2lb24f21kncr924gxr00178a9x0jy";
  };

  buildInputs = [ gcc cmake which python perl gettext curl autoconf automake libtool git ];

  dontStrip = true;

  configurePhase = ''
    patchShebangs ./
    ./configure --prefix=$out --enable-llvm
  '';
}
