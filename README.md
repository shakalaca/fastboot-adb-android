Fastboot and adb for Android devices
====================================

Build with NDK, for libcrypto please read " Building Prerequisites " section in https://boringssl.googlesource.com/boringssl/+/HEAD/BUILDING.md

Steps:

1. `sh 01_getsource.sh` to get source codes
2. `sh 02_build_libcrypto.sh` to build libcrypto.a (will be at src/boringssl/dist)
3. `sh 03_build_fastboot.sh` to build fastboot binary
3. `sh 04_build_adb.sh` to build adb binary

Only tested on Android 6.0 device.
