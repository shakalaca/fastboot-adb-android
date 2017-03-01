LOCAL_PATH := $(call my-dir)

adb_version := $(shell git -C $(LOCAL_PATH) rev-parse --short=12 HEAD 2>/dev/null)-android

include $(CLEAR_VARS)

LOCAL_MODULE := adb

LOCAL_CPPFLAGS := -std=c++14

LOCAL_CFLAGS := \
    -Wall -Wextra -Werror \
    -Wno-unused-parameter \
    -Wno-missing-field-initializers \
    -Wvla \
    -Wexit-time-destructors \
    -fvisibility=hidden \
    -DADB_REVISION='"shakalaca-$(shell date +%Y-%m-%d)-$(adb_version)"' \
    -DADB_HOST=1 -DADB_HOST_ON_TARGET=1 -D_GNU_SOURCE

LOCAL_C_INCLUDES := \
    src/system/core/adb \
    src/system/core/include \
    src/system/core/mkbootimg \

LOCAL_SRC_FILES := \
    src/system/core/adb/adb.cpp \
    src/system/core/adb/adb_auth.cpp \
    src/system/core/adb/adb_io.cpp \
    src/system/core/adb/adb_listeners.cpp \
    src/system/core/adb/adb_trace.cpp \
    src/system/core/adb/adb_utils.cpp \
    src/system/core/adb/fdevent.cpp \
    src/system/core/adb/sockets.cpp \
    src/system/core/adb/transport.cpp \
    src/system/core/adb/transport_local.cpp \
    src/system/core/adb/transport_usb.cpp \
    \
    src/system/core/adb/get_my_path_linux.cpp \
    src/system/core/adb/sysdeps_unix.cpp \
    src/system/core/adb/usb_linux.cpp \
    \
    src/system/core/adb/adb_auth_host.cpp \
    \
    src/system/core/adb/diagnose_usb.cpp \
    \
    src/system/core/adb/adb_client.cpp \
    src/system/core/adb/bugreport.cpp \
    src/system/core/adb/client/main.cpp \
    src/system/core/adb/console.cpp \
    src/system/core/adb/commandline.cpp \
    src/system/core/adb/file_sync_client.cpp \
    src/system/core/adb/line_printer.cpp \
    src/system/core/adb/services.cpp \
    src/system/core/adb/shell_service_protocol.cpp

# libutils
LOCAL_SRC_FILES += \
    src/system/core/libutils/FileMap.cpp

LOCAL_LDLIBS := -ldl
LOCAL_STATIC_LIBRARIES := crypto decrepit base cutils log_fake

include $(BUILD_EXECUTABLE)

include $(LOCAL_PATH)/Android_library.mk
