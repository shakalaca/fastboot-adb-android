LOCAL_PATH := $(call my-dir)

fastboot_version := $(shell git -C $(LOCAL_PATH) rev-parse --short=12 HEAD 2>/dev/null)-android

include $(CLEAR_VARS)

LOCAL_MODULE := fastboot

LOCAL_CFLAGS := \
    -DANDROID_HOST_BUILD -DADB_HOST \
    -Wall -Wextra -Werror -Wunreachable-code \
    -DFASTBOOT_REVISION='"shakalaca-$(shell date +%Y-%m-%d)-$(fastboot_version)"'

LOCAL_C_INCLUDES := \
    src/system/core/include \
    src/system/core/adb \
    src/system/core/mkbootimg \
    src/system/extras/f2fs_utils \
    src/external/gtest/include

LOCAL_SRC_FILES := \
    src/system/core/fastboot/bootimg_utils.cpp \
    src/system/core/fastboot/engine.cpp \
    src/system/core/fastboot/fastboot.cpp \
    src/system/core/fastboot/fs.cpp\
    src/system/core/fastboot/protocol.cpp \
    src/system/core/fastboot/socket.cpp \
    src/system/core/fastboot/tcp.cpp \
    src/system/core/fastboot/udp.cpp \
    src/system/core/fastboot/util.cpp \
    src/system/core/fastboot/usb_linux.cpp \
    src/system/core/fastboot/util_linux.cpp

# libziparchive
LOCAL_SRC_FILES += \
    src/system/core/libziparchive/zip_archive.cc

# libutils
LOCAL_SRC_FILES += \
    src/system/core/libutils/FileMap.cpp

# libdiagnose_usb
LOCAL_SRC_FILES += \
    src/system/core/adb/diagnose_usb.cpp

LOCAL_LDLIBS += -lz
LOCAL_STATIC_LIBRARIES := selinux ext4_utils sparse base cutils log_fake

ifeq ($(SUPPORT_F2FS),yes)
LOCAL_CFLAGS += -DUSE_F2FS
LOCAL_STATIC_LIBRARIES += f2fs_utils
endif

include $(BUILD_EXECUTABLE)

include $(LOCAL_PATH)/Android_library.mk
