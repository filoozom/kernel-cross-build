#!/usr/bin/env bash

. $(pwd)/config.sh

cd $LINUX_FOLDER
echo "-$PKGREL-$BUILD_FLAVOR" > localversion-alpine
cp $INITIAL_PWD/kernel-config .config
$INITIAL_PWD/make.sh listnewconfig oldconfig

