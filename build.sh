#!/usr/bin/env bash

source $(pwd)/config.sh

unset LDFLAGS
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

cd $LINUX_FOLDER
$INITIAL_PWD/make.sh KBUILD_BUILD_VERSION="$((PKGREL + 1))-Alpine"

