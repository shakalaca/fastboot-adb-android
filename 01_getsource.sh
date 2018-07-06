#!/bin/sh

clone() {
  repo=$1
  git clone -b android-8.1.0_r41 https://android.googlesource.com/platform/$repo src/$repo
}

mkdir src

mkdir src/system
clone system/core
clone system/extras

mkdir src/external
clone external/selinux
clone external/pcre
clone external/f2fs-tools
clone external/e2fsprogs
clone external/mdnsresponder
clone external/libusb

git clone https://boringssl.googlesource.com/boringssl src/boringssl

cd src/system/core
patch -p1 < ../../../99_patch_core
cd ../../..
