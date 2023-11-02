set -eux

echo "build in alpine"

tar -xaf /mnt/pkg.tar.zst -C /usr/local --strip-components=1 usr/bin/qemu-aarch64-static

qemu-aarch64-static -version

cat << EOS > /etc/wsl.conf
[automount]
options = "metadata,umask=22,fmask=11"
[interop]
appendWindowsPath = false
EOS

echo "DONE!"
