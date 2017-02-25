#!/bin/sh
ndk-build NDK_PROJECT_PATH=. NDK_APP_LIBS_OUT=dist NDK_APPLICATION_MK=Application_fastboot.mk
