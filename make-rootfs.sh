#!/bin/sh
set -eux

rm rootfs.tar.gz || true
rm rootfs.tar.gz.sha256 || true

cd content
rm pkg.tar.zst || true
curl -fsL https://archlinux.org/packages/extra/x86_64/qemu-user-static/download/ -o pkg.tar.zst
cd ..

sudo ./alpine-make-rootfs \
	--branch 'v3.18' \
	--packages 'apk-tools curl tar xz zstd sudo vim git openssh-client' \
	--script-chroot \
	rootfs.tar.gz -- content/alpine.sh

sha256sum rootfs.tar.gz > rootfs.tar.gz.sha256

cat rootfs.tar.gz.sha256
