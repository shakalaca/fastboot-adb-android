LOCAL_PATH := $(call my-dir)

##############################################################################
# libcrypto_utils
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libcrypto_utils

LOCAL_EXPORT_C_INCLUDES := \
    src/system/core/libcrypto_utils/include

LOCAL_C_INCLUDES := \
    src/system/core/libcrypto_utils/include \
    src/boringssl/include

LOCAL_SRC_FILES := \
    src/system/core/libcrypto_utils/android_pubkey.c

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libusb
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libusb

LOCAL_CFLAGS := \
    -Wno-switch

LOCAL_EXPORT_C_INCLUDES := \
    src/external/libusb/include

LOCAL_C_INCLUDES := \
    src/external/libusb/libusb \
    src/external/libusb/libusb/os \
    src/external/libusb/android

LOCAL_SRC_FILES := \
    src/external/libusb/libusb/core.c \
    src/external/libusb/libusb/descriptor.c \
    src/external/libusb/libusb/hotplug.c \
    src/external/libusb/libusb/io.c \
    src/external/libusb/libusb/sync.c \
    src/external/libusb/libusb/strerror.c \
    \
    src/external/libusb/libusb/os/linux_usbfs.c \
    src/external/libusb/libusb/os/poll_posix.c \
    src/external/libusb/libusb/os/threads_posix.c \
    src/external/libusb/libusb/os/linux_netlink.c

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libmdnssd
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libmdnssd

LOCAL_CFLAGS := \
    -DTARGET_OS_LINUX -DHAVE_LINUX -DUSES_NETLINK \
    -O2 -g \
    -fno-strict-aliasing \
    -D_GNU_SOURCE \
    -DHAVE_IPV6 \
    -DNOT_HAVE_SA_LEN \
    -DPLATFORM_NO_RLIMIT \
    -DMDNS_DEBUGMSGS=0 \
    -DMDNS_UDS_SERVERPATH=\"/dev/socket/mdnsd\" \
    -DMDNS_USERNAME=\"mdnsr\" \
    -W \
    -Wall \
    -Wextra \
    -Wno-array-bounds \
    -Wno-pointer-sign \
    -Wno-unused \
    -Wno-unused-parameter \
    -Werror=implicit-function-declaration

LOCAL_EXPORT_C_INCLUDES := \
    src/external/mdnsresponder/mDNSShared

LOCAL_C_INCLUDES := \
    src/external/mdnsresponder/mDNSShared

LOCAL_SRC_FILES := \
    src/external/mdnsresponder/mDNSShared/dnssd_clientlib.c  \
    src/external/mdnsresponder/mDNSShared/dnssd_clientstub.c \
    src/external/mdnsresponder/mDNSShared/dnssd_ipc.c

LOCAL_STATIC_LIBRARIES := libcutils

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libpcre
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libpcre

LOCAL_CFLAGS := \
    -DHAVE_CONFIG_H \
    -Wno-self-assign \
    -Wno-unused-parameter

LOCAL_EXPORT_C_INCLUDES := \
    src/external/pcre/include

LOCAL_C_INCLUDES := \
    src/external/pcre/include \
    src/external/pcre/include_internal

LOCAL_SRC_FILES := \
    src/external/pcre/dist2/src/pcre2_auto_possess.c \
    src/external/pcre/dist2/src/pcre2_compile.c \
    src/external/pcre/dist2/src/pcre2_config.c \
    src/external/pcre/dist2/src/pcre2_context.c \
    src/external/pcre/dist2/src/pcre2_dfa_match.c \
    src/external/pcre/dist2/src/pcre2_error.c \
    src/external/pcre/dist2/src/pcre2_find_bracket.c \
    src/external/pcre/dist2/src/pcre2_maketables.c \
    src/external/pcre/dist2/src/pcre2_match.c \
    src/external/pcre/dist2/src/pcre2_match_data.c \
    src/external/pcre/dist2/src/pcre2_jit_compile.c \
    src/external/pcre/dist2/src/pcre2_newline.c \
    src/external/pcre/dist2/src/pcre2_ord2utf.c \
    src/external/pcre/dist2/src/pcre2_pattern_info.c \
    src/external/pcre/dist2/src/pcre2_serialize.c \
    src/external/pcre/dist2/src/pcre2_string_utils.c \
    src/external/pcre/dist2/src/pcre2_study.c \
    src/external/pcre/dist2/src/pcre2_substitute.c \
    src/external/pcre/dist2/src/pcre2_substring.c \
    src/external/pcre/dist2/src/pcre2_tables.c \
    src/external/pcre/dist2/src/pcre2_ucd.c \
    src/external/pcre/dist2/src/pcre2_valid_utf.c \
    src/external/pcre/dist2/src/pcre2_xclass.c \
    src/external/pcre/dist2/src/pcre2_chartables.c    

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libselinux
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libselinux

LOCAL_CFLAGS := \
    -DHOST -DUSE_PCRE2

LOCAL_EXPORT_C_INCLUDES := \
    src/external/selinux/libselinux/include

LOCAL_C_INCLUDES := \
    src/external/selinux/libselinux/include \
    src/external/pcre/include

LOCAL_SRC_FILES := \
    src/external/selinux/libselinux/src/label_file.c \
    src/external/selinux/libselinux/src/regex.c \
    src/external/selinux/libselinux/src/android/android_host.c \
    src/external/selinux/libselinux/src/avc.c \
    src/external/selinux/libselinux/src/avc_internal.c \
    src/external/selinux/libselinux/src/avc_sidtab.c \
    src/external/selinux/libselinux/src/compute_av.c \
    src/external/selinux/libselinux/src/compute_create.c \
    src/external/selinux/libselinux/src/compute_member.c \
    src/external/selinux/libselinux/src/context.c \
    src/external/selinux/libselinux/src/enabled.c \
    src/external/selinux/libselinux/src/getenforce.c \
    src/external/selinux/libselinux/src/getfilecon.c \
    src/external/selinux/libselinux/src/get_initial_context.c \
    src/external/selinux/libselinux/src/init.c \
    src/external/selinux/libselinux/src/load_policy.c \
    src/external/selinux/libselinux/src/mapping.c \
    src/external/selinux/libselinux/src/procattr.c \
    src/external/selinux/libselinux/src/setexecfilecon.c \
    src/external/selinux/libselinux/src/stringrep.c

LOCAL_STATIC_LIBRARIES := pcre

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libsparse
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libsparse

LOCAL_CFLAGS := \
    -Werror

LOCAL_EXPORT_C_INCLUDES := \
    src/system/core/libsparse/include

LOCAL_C_INCLUDES := \
    src/system/core/libsparse/include \
    src/system/core/base/include

LOCAL_SRC_FILES += \
    src/system/core/libsparse/backed_block.c \
    src/system/core/libsparse/output_file.c \
    src/system/core/libsparse/sparse.c \
    src/system/core/libsparse/sparse_crc32.c \
    src/system/core/libsparse/sparse_err.c \
    src/system/core/libsparse/sparse_read.cpp

include $(BUILD_STATIC_LIBRARY)

##############################################################################
#libext4_utils
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libext4_utils

LOCAL_CFLAGS := \
    -fno-strict-aliasing

LOCAL_C_INCLUDES := \
    src/system/extras/ext4_utils/include

LOCAL_EXPORT_C_INCLUDES := \
    src/system/extras/ext4_utils \
    src/system/extras/ext4_utils/include

LOCAL_SRC_FILES += \
    src/system/extras/ext4_utils/make_ext4fs.c \
    src/system/extras/ext4_utils/ext4fixup.c \
    src/system/extras/ext4_utils/ext4_utils.c \
    src/system/extras/ext4_utils/allocate.c \
    src/system/extras/ext4_utils/contents.c \
    src/system/extras/ext4_utils/extent.c \
    src/system/extras/ext4_utils/indirect.c \
    src/system/extras/ext4_utils/sha1.c \
    src/system/extras/ext4_utils/wipe.c \
    src/system/extras/ext4_utils/crc16.c \
    src/system/extras/ext4_utils/ext4_sb.c

LOCAL_STATIC_LIBRARIES := selinux sparse

include $(BUILD_STATIC_LIBRARY)

ifeq ($(SUPPORT_F2FS),yes)
##############################################################################
# libext2_uuid
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libext2_uuid

LOCAL_SRC_FILES := \
    src/external/e2fsprogs/lib/uuid/clear.c \
    src/external/e2fsprogs/lib/uuid/compare.c \
    src/external/e2fsprogs/lib/uuid/copy.c \
    src/external/e2fsprogs/lib/uuid/gen_uuid.c \
    src/external/e2fsprogs/lib/uuid/isnull.c \
    src/external/e2fsprogs/lib/uuid/pack.c \
    src/external/e2fsprogs/lib/uuid/parse.c \
    src/external/e2fsprogs/lib/uuid/unpack.c \
    src/external/e2fsprogs/lib/uuid/unparse.c \
    src/external/e2fsprogs/lib/uuid/uuid_time.c

LOCAL_C_INCLUDES := \
    src/external/e2fsprogs/lib

LOCAL_EXPORT_C_INCLUDES := \
    src/external/e2fsprogs/lib \
    src/external/e2fsprogs

LOCAL_CFLAGS := -O2 -g -W -Wall \
    -Wno-unused-parameter \
    -Wno-unused-function \
	-DHAVE_INTTYPES_H \
	-DHAVE_UNISTD_H \
	-DHAVE_ERRNO_H \
	-DHAVE_NETINET_IN_H \
	-DHAVE_SYS_IOCTL_H \
	-DHAVE_SYS_MMAN_H \
	-DHAVE_SYS_MOUNT_H \
	-DHAVE_SYS_PRCTL_H \
	-DHAVE_SYS_RESOURCE_H \
	-DHAVE_SYS_SELECT_H \
	-DHAVE_SYS_STAT_H \
	-DHAVE_SYS_TYPES_H \
	-DHAVE_STDLIB_H \
	-DHAVE_STRDUP \
	-DHAVE_MMAP \
	-DHAVE_UTIME_H \
	-DHAVE_GETPAGESIZE \
	-DHAVE_LSEEK64 \
	-DHAVE_LSEEK64_PROTOTYPE \
	-DHAVE_EXT2_IOCTLS \
	-DHAVE_LINUX_FD_H \
	-DHAVE_TYPE_SSIZE_T \
	-DHAVE_SYS_TIME_H \
        -DHAVE_SYS_PARAM_H \
	-DHAVE_SYSCONF

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libf2fs_utils
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libf2fs_utils

LOCAL_CFLAGS := \
    -DANDROID_HOST_BUILD \
    -DF2FS_MAJOR_VERSION=1 \
    -DF2FS_MINOR_VERSION=4 \
    -DF2FS_TOOLS_VERSION=\"1.4.0\" \
    -DF2FS_TOOLS_DATE=\"2014-10-18\" \
    -Wno-unused-parameter

LOCAL_EXPORT_C_INCLUDES := \
    src/system/extras/f2fs_utils \
    src/external/f2fs-tools/include \
    src/external/f2fs-tools/mkfs

LOCAL_C_INCLUDES := \
    src/external/f2fs-tools/include \
    src/external/f2fs-tools/mkfs

LOCAL_SRC_FILES += \
    src/system/extras/f2fs_utils/f2fs_utils.c \
    src/system/extras/f2fs_utils/f2fs_ioutils.c \
    src/external/f2fs-tools/lib/libf2fs.c \
    src/external/f2fs-tools/mkfs/f2fs_format.c \

LOCAL_STATIC_LIBRARIES := ext2_uuid selinux sparse

include $(BUILD_STATIC_LIBRARY)
endif # SUPPORT_F2FS

##############################################################################
# liblog
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := liblog_fake

LOCAL_CFLAGS := \
    -DFAKE_LOG_DEVICE=1 \
    -DANDROID_HOST_BUILD \
    -DSNET_EVENT_LOG_TAG=1397638484 -DLIBLOG_LOG_TAG=1005 \
    -Werror -fvisibility=hidden

LOCAL_EXPORT_C_INCLUDES := \
    src/system/core/liblog

LOCAL_C_INCLUDES := \
    src/system/core/include

LOCAL_SRC_FILES += \
    src/system/core/liblog/config_read.c \
    src/system/core/liblog/config_write.c \
    src/system/core/liblog/local_logger.c \
    src/system/core/liblog/log_event_list.c \
    src/system/core/liblog/log_event_write.c \
    src/system/core/liblog/log_ratelimit.cpp \
    src/system/core/liblog/logger_lock.c \
    src/system/core/liblog/logger_name.c \
    src/system/core/liblog/logger_read.c \
    src/system/core/liblog/logger_write.c \
    src/system/core/liblog/logprint.c \
    src/system/core/liblog/stderr_write.c \
    \
    src/system/core/liblog/fake_log_device.c \
    src/system/core/liblog/fake_writer.c \
    \
    src/system/core/liblog/event_tag_map.cpp \
#    src/system/core/liblog/log_time.cpp \
#    src/system/core/liblog/pmsg_reader.c \
#    src/system/core/liblog/pmsg_writer.c \
#    src/system/core/liblog/logd_reader.c \
#    src/system/core/liblog/logd_writer.c \
#    src/system/core/liblog/properties.c \

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libbase
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libbase

LOCAL_CPPFLAG := \
    -Wall \
    -Wextra \
    -Werror \
    -Wexit-time-destructors \

LOCAL_CFLAGS := \
    -DANDROID_HOST_BUILD \
    -D__USE_BSD

LOCAL_EXPORT_C_INCLUDES := \
    src/system/core/base/include

LOCAL_C_INCLUDES := \
    src/system/core/include \
    src/system/core/base/include

LOCAL_SRC_FILES += \
    src/system/core/base/file.cpp \
    src/system/core/base/logging.cpp \
    src/system/core/base/parsenetaddress.cpp \
    src/system/core/base/quick_exit.cpp \
    src/system/core/base/stringprintf.cpp \
    src/system/core/base/strings.cpp \
    src/system/core/base/test_utils.cpp \
    \
    src/system/core/base/errors_unix.cpp

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libcutils
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libcutils

LOCAL_CFLAGS := \
    -DANDROID_HOST_BUILD \
    -Werror -Wall -Wextra -std=gnu90 -Wno-typedef-redefinition

LOCAL_CPPFLAGS := -std=c++14

LOCAL_C_INCLUDES := \
    src/system/core/include \
    src/system/core/liblog/include \
    $(NDK_ROOT)/sysroot/usr/include

LOCAL_SRC_FILES += \
    src/system/core/libcutils/config_utils.c \
    src/system/core/libcutils/canned_fs_config.c \
    src/system/core/libcutils/hashmap.c \
    src/system/core/libcutils/iosched_policy.c \
    src/system/core/libcutils/load_file.c \
    src/system/core/libcutils/native_handle.c \
    src/system/core/libcutils/open_memstream.c \
    src/system/core/libcutils/record_stream.c \
    src/system/core/libcutils/sockets.cpp \
    src/system/core/libcutils/strdup16to8.c \
    src/system/core/libcutils/strdup8to16.c \
    src/system/core/libcutils/strlcpy.c \
    src/system/core/libcutils/threads.c \
    \
    src/system/core/libcutils/android_get_control_file.cpp \
    src/system/core/libcutils/fs.c \
    src/system/core/libcutils/multiuser.c \
    src/system/core/libcutils/socket_inaddr_any_server_unix.c \
    src/system/core/libcutils/socket_local_client_unix.c \
    src/system/core/libcutils/socket_local_server_unix.c \
    src/system/core/libcutils/socket_network_client_unix.c \
    src/system/core/libcutils/sockets_unix.cpp \
    src/system/core/libcutils/str_parms.c \
    \
    src/system/core/libcutils/android_reboot.c \
    src/system/core/libcutils/ashmem-dev.c \
    src/system/core/libcutils/partition_utils.c \
    src/system/core/libcutils/properties.cpp \
    src/system/core/libcutils/qtaguid.c \
    src/system/core/libcutils/trace-dev.c \
    src/system/core/libcutils/uevent.c

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_SRC_FILES += \
    src/system/core/libcutils/arch-arm/memset32.S
endif

ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
LOCAL_SRC_FILES += \
    src/system/core/libcutils/arch-arm64/android_memset.S
endif

ifeq ($(TARGET_ARCH_ABI),x86)
LOCAL_SRC_FILES += \
    src/system/core/libcutils/arch-x86/android_memset16.S \
    src/system/core/libcutils/arch-x86/android_memset32.S
endif

ifeq ($(TARGET_ARCH_ABI),x86_64)
LOCAL_SRC_FILES += \
    src/system/core/libcutils/arch-x86_64/android_memset16.S \
    src/system/core/libcutils/arch-x86_64/android_memset32.S
endif

LOCAL_SANITIZE := integer

include $(BUILD_STATIC_LIBRARY)

##############################################################################
# libcrypto
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libcrypto
LOCAL_EXPORT_C_INCLUDES := src/boringssl/include
LOCAL_SRC_FILES := src/boringssl/dist/$(TARGET_ARCH_ABI)/libcrypto.a

include $(PREBUILT_STATIC_LIBRARY)

##############################################################################
# libdecrepit
##############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := libdecrepit
LOCAL_EXPORT_C_INCLUDES := src/boringssl/include
LOCAL_SRC_FILES := src/boringssl/dist/$(TARGET_ARCH_ABI)/libdecrepit.a

include $(PREBUILT_STATIC_LIBRARY)
