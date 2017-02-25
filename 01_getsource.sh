#!/bin/sh

clone() {
  repo=$1
  git clone -b android-7.1.1_r22 https://android.googlesource.com/platform/$repo src/$repo
}

mkdir src
clone bionic

mkdir src/system
clone system/core
clone system/extras

mkdir src/external
clone external/gtest
clone external/selinux
clone external/pcre
clone external/libusb
clone external/f2fs-tools

git clone https://boringssl.googlesource.com/boringssl src/boringssl

cd src
patch -p0 < ../99_patch
