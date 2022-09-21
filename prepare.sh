#!/usr/bin/env bash

. $(pwd)/config.sh

if [ -d "$SRC_FOLDER" ]
then
	echo "Source folder ($SRC_FOLDER) already exists."
	exit 1
fi

mkdir $SRC_FOLDER
cd $SRC_FOLDER

# Prepare
wget -nc https://cdn.kernel.org/pub/linux/kernel/v$KERNEL_VERSION_MAJOR.x/linux-$KERNEL_VERSION_MINOR.tar.xz
wget -nc https://cdn.kernel.org/pub/linux/kernel/v5.x/patch-$KERNEL_VERSION.xz
unxz linux-$KERNEL_VERSION_MINOR.tar.xz
tar xvf linux-$KERNEL_VERSION_MINOR.tar

cd linux-$KERNEL_VERSION_MINOR
unxz -c ../patch-$KERNEL_VERSION.xz | patch -p1 -N

# Old config
echo "-$PKGREL-$BUILD_FLAVOR" > localversion-alpine
cp $INITIAL_PWD/kernel-config .config
$INITIAL_PWD/make.sh listnewconfig oldconfig

