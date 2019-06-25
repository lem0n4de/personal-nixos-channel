with import <nixpkgs> {};

let
  commit_hash = "016fd2b38f87d56344b87b588a6c887628884482";
in
stdenv.mkDerivation {
  name = "create_ap-${commit_hash}";

  src = fetchgit {
    url = "https://github.com/oblique/create_ap";
    rev = commit_hash;
    sha256 = "14y6z3865z04ddjszi73ij6ja971vic7f2c1wsvdc7whxw6hqsb5";
  };

  buildInputs = [ utillinux procps hostapd iproute iw haveged dnsmasq iptables makeWrapper ];

    # substituteInPlace Makefile --replace "/usr" "$out/usr"
  configurePhase = ''
    patchShebangs ./
    substituteInPlace Makefile --replace "/etc" "$out/etc"
  '';

  installPhase = ''
    make install PREFIX=$out/usr

    echo $PATH
    wrapProgram $out/usr/bin/create_ap --prefix PATH : ${lib.makeBinPath [ utillinux procps hostapd iproute haveged dnsmasq iptables ]}
  '';

  meta = {
    homepage = "https://github.com/oblique/create_ap";
    description = "A script that creates a NATed or Bridged WiFi Access Point.";
    license = stdenv.lib.licenses.bsd2;
  };
}
