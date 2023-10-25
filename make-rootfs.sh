#!/bin/sh
set -eux

sudo ./alpine-make-rootfs \
	--branch 'v3.18' \
	--packages 'apk-tools curl tar xz zstd git openssh-client' \
	--script-chroot \
	rootfs.tar.gz -- content/alpine.sh

sha256sum rootfs.tar.gz > rootfs.tar.gz.sha256

cat rootfs.tar.gz.sha256
