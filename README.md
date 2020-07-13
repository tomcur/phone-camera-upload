# phone-camera-upload
This script recompresses and uploads synced pictures and videos from my Phone to a WebDAV server.

Pictures are recompressed to medium quality using the SmallFry JPEG optimizer from [jpeg-archive](https://github.com/danielgtaylor/jpeg-archive).

Videos are recompressed/re-encoded to H.265 with a constant rate factor using [ffmpeg](https://ffmpeg.org).
