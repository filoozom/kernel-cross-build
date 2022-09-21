#!/usr/bin/env bash

if [[ $# -ne 1 ]] ; then
	echo "usage: ./set-config.sh config"
	exit 1
fi

. $(pwd)/config.sh

cd $LINUX_FOLDER
echo "-$PKGREL-$BUILD_FLAVOR" > localversion-alpine
cp $INITIAL_PWD/$1 .config
$INITIAL_PWD/make.sh listnewconfig oldconfig

