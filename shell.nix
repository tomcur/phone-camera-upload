with import <nixpkgs> { };
let
  python-packages = python-packages: [
    python-packages.requests
    python-packages.imageio
    python-packages.imageio-ffmpeg
  ];
  python-with-packages = python37.withPackages python-packages;
in pkgs.mkShell {
  buildInputs = [
    python-with-packages
    python37Packages.black
    python37Packages.python-language-server
    ffmpeg
    jpeg-archive
  ];
}
