set -eux

echo "build in alpine"

tar -xaf /mnt/pkg.tar.zst -C /usr/local --strip-components=1 usr/bin/qemu-aarch64-static

adduser -u 1000 -D alpine

qemu-aarch64-static -version

echo "DONE!"
