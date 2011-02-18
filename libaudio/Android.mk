ifneq ($(BUILD_TINY_ANDROID),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=               \
    AudioPolicyManager.cpp

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    libmedia

LOCAL_STATIC_LIBRARIES := libaudiopolicybase

LOCAL_MODULE:= libaudiopolicy

ifeq ($(BOARD_HAVE_BLUETOOTH),true)
  LOCAL_CFLAGS += -DWITH_A2DP
endif

include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)

LOCAL_MODULE := libaudio

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    libmedia \
    libhardware_legacy

ifeq ($TARGET_OS)-$(TARGET_SIMULATOR),linux-true)
LOCAL_LDLIBS += -ldl
endif

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_SHARED_LIBRARIES += libdl
endif

LOCAL_SRC_FILES += AudioHardware.cpp

LOCAL_CFLAGS += -fno-short-enums

LOCAL_STATIC_LIBRARIES += libaudiointerface

ifeq ($(USE_PROPRIETARY_AUDIO_EXTENSIONS),true)
LOCAL_SRC_FILES += AudioPostProcessor.cpp
LOCAL_STATIC_LIBRARIES += \
    libEverest_motomm-r \
    libCortexA9_aie-r \
    libCortexA9_sas-r \
    libCortexA9_se-r \
    libCortexA9_motovoice-r \
    libCortexA9_ecns-r \
    libsamplerateconverter \
    libCortexA9_anm-r

LOCAL_CFLAGS += -DUSE_PROPRIETARY_AUDIO_EXTENSIONS
LOCAL_C_INCLUDES += vendor/moto/stingray/motomm/ghdr
LOCAL_C_INCLUDES += vendor/moto/stingray/motomm/rate_conv
endif

ifeq ($(BOARD_HAVE_BLUETOOTH),true)
  LOCAL_SHARED_LIBRARIES += liba2dp
endif

include $(BUILD_SHARED_LIBRARY)

endif # not BUILD_TINY_ANDROID

