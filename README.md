# phone-camera-upload
This script recompresses and uploads synced pictures and videos from my phone
to a remote.

Currently supported remotes:
- WebDAV servers;
- local directories.

Pictures are recompressed to medium quality using the SmallFry JPEG optimizer from [jpeg-archive](https://github.com/danielgtaylor/jpeg-archive).

Videos are recompressed/re-encoded to H.265 with a constant rate factor using [ffmpeg](https://ffmpeg.org).

# Building / Installing
## With Nix
Run:

```bash
$ git clone https://github.com/tomcur/phone-camera-upload.git
$ cd phone-camera-upload
$ nix-env --file default.nix -i
```
This installs the required dependencies and places phone-camera-upload's executables in
your path.

## With Nix flakes
Run:

```bash
$ git clone https://github.com/tomcur/phone-camera-upload.git
$ cd phone-camera-upload
$ nix build .#
```

This places phone-camera-upload's executables in `./result/bin`.

# Usage
Copy `./config/phone-camera-upload.json.example` to
`$HOME/.config/phone-camera-upload/config.json` and edit it with your remote
details.

The script is hardcoded to upload media in
`~/syncthing/oneplus-a3003-camera/Camera` to the configured remote. It stores
file names of successful uploads in `~/.local/share/phone-camera-upload`.

To start the script, run:

```bash
$ phone-camera-upload
```
