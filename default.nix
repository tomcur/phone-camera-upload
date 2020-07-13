with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "thingshare-${version}";
  version = "0.2.0";

  src = ./.;
  nativeBuildInputs = [ makeWrapper ];

  phases = "installPhase";

  installPhase = ''
    mkdir -p $out/bin
    cp ${src}/bin/* $out/bin/
    chmod +x $out/bin/*
    wrapProgram $out/bin/thingshare_clipboard --prefix PATH : ${
      lib.makeBinPath [
        pkgs.libnotify
        pkgs.coreutils
        pkgs.gnugrep
        pkgs.curl
        pkgs.jq
        pkgs.file
        pkgs.gawk
        pkgs.xxd
        pkgs.xclip
      ]
    }
    wrapProgram $out/bin/thingshare_screenshot --prefix PATH : ${
      lib.makeBinPath [
        pkgs.libnotify
        pkgs.scrot
        pkgs.flameshot
        pkgs.coreutils
        pkgs.gnugrep
        pkgs.curl
        pkgs.jq
        pkgs.file
        pkgs.gawk
        pkgs.xxd
      ]
    }
    wrapProgram $out/bin/thingshare_init --prefix PATH : ${
      lib.makeBinPath [ pkgs.flameshot ]
    }
  '';

  meta = { description = "Share screenshots and your clipboard."; };
}
