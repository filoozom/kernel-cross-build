#!/usr/bin/env bash

. $(pwd)/config.sh

cd $LINUX_FOLDER
mkdir -p "$OUTDIR"/boot "$OUTDIR"/lib/modules

$INITIAL_PWD/make.sh modules_install $INSTALL \
	ARCH="arm64" \
	INSTALL_MOD_PATH="$OUTDIR" \
	INSTALL_PATH="$OUTDIR"/boot \
	INSTALL_DTBS_PATH="$OUTDIR/boot/dtbs-$BUILD_FLAVOR"

rm -f "$OUTDIR"/lib/modules/${ABI_RELEASE}/build \
	"$OUTDIR"/lib/modules/${ABI_RELEASE}/source
rm -rf "$OUTDIR"/lib/firmware

install -D -m644 include/config/kernel.release \
	"$OUTDIR"/usr/share/kernel/$BUILD_FLAVOR/kernel.release
