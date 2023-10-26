set -eux

echo "build in alpine"

tar -xaf /mnt/pkg.tar.zst -C /usr/local --strip-components=1 usr/bin/qemu-aarch64-static

qemu-aarch64-static -version

adduser -u 1000 -D -s /bin/ash alpine
addgroup alpine wheel

cat << EOS > /etc/sudoers.d/users
%wheel ALL=(ALL:ALL) NOPASSWD: ALL
EOS

cat << EOS > /etc/wsl.conf
[automount]
options = "metadata,umask=22,fmask=11"
[user]
default = alpine
[interop]
appendWindowsPath = false
EOS

cp ./profile.sh /home/alpine/.profile 
chown 1000:1000 /home/alpine/.profile

echo "DONE!"
