# Copyright 2006 The Android Open Source Project
#
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= tctl.c
LOCAL_MODULE_TAGS:= optional
LOCAL_MODULE:= tctl
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= tplay.c
LOCAL_MODULE_TAGS:= optional
LOCAL_MODULE:= tplay
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= trec.c
LOCAL_MODULE_TAGS:= optional
LOCAL_MODULE:= trec
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= twav.c
LOCAL_MODULE:= twav
LOCAL_MODULE_TAGS:= optional
LOCAL_IS_HOST_MODULE := true
include $(BUILD_HOST_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= resample.c
LOCAL_MODULE:= tdownsample
LOCAL_MODULE_TAGS:= optional
LOCAL_IS_HOST_MODULE := true
include $(BUILD_HOST_EXECUTABLE)
