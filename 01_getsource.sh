#!/bin/sh

clone() {
  repo=$1
  git clone -b android-7.1.2_r33 https://android.googlesource.com/platform/$repo src/$repo
}

mkdir src

mkdir src/system
clone system/core
clone system/extras

mkdir src/external
clone external/gtest
clone external/libselinux
clone external/pcre
clone external/f2fs-tools
clone external/e2fsprogs

git clone https://boringssl.googlesource.com/boringssl src/boringssl

pushd src/system/core
patch -p1 < ../../../99_patch_core
popd
pushd src/system/extras
patch -p1 < ../../../99_patch_extra
popd
