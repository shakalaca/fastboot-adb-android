LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := fastboot

LOCAL_CFLAGS := \
    -DANDROID_HOST_BUILD -DADB_HOST \
    -Wall -Wextra -Werror -Wunreachable-code \
    -DFASTBOOT_REVISION='"shakalaca-$(shell date +%Y-%m-%d)"' \
    -DUSE_F2FS

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

LOCAL_LDLIBS += -lz -llog
LOCAL_STATIC_LIBRARIES := selinux ext4_utils f2fs_utils sparse base cutils

include $(BUILD_EXECUTABLE)

include $(LOCAL_PATH)/Android_library.mk
