{
  description = "Recompress and upload synced pictures and videos from a Phone to a WebDAV server";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
      rec {
        packages = {
          phone-camera-upload = pkgs.python3Packages.buildPythonApplication
            rec {
              propagatedBuildInputs =
                with pkgs; let
                  python-packages = python-packages: [
                    python-packages.requests
                    python-packages.imageio
                    python-packages.imageio-ffmpeg
                  ];
                  python-with-packages = python3.withPackages python-packages;
                in
                [
                  python-with-packages
                  ffmpeg
                  jpeg-archive
                ];
              pname = "phone-camera-upload";
              version = "0.1.0";
              src = ./.;
            };
        };
        defaultPackage = packages.phone-camera-upload;
        devShell = packages.phone-camera-upload;
      });
}
