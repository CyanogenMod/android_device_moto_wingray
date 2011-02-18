LOCAL_PATH := $(call my-dir)

ifneq ($(AP_MODEM_CDMA_BLDSRC),1)
file := $(TARGET_OUT_SHARED_LIBRARIES)/libmoto_ril.so
$(file) : $(LOCAL_PATH)/libmoto_ril.so | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
endif

ifneq ($(AP_MODEM_CDMA_BLDSRC),1)
file := $(PRODUCT_OUT)/obj/lib/libmoto_ril.so
$(file) : $(LOCAL_PATH)/libmoto_ril.so | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
endif

ifneq ($(AP_MODEM_CDMA_BLDSRC),1)
file := $(TARGET_OUT_SHARED_LIBRARIES)/libpppd_plugin-ril.so
$(file) : $(LOCAL_PATH)/libpppd_plugin-ril.so | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
endif

ifneq ($(AP_MODEM_CDMA_BLDSRC),1)
file := $(TARGET_OUT_SHARED_LIBRARIES)/libril_rds.so
$(file) : $(LOCAL_PATH)/libril_rds.so | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
endif

ifneq ($(AP_MODEM_CDMA_BLDSRC),1)
file := $(TARGET_OUT_EXECUTABLES)/chat-ril
$(file) : $(LOCAL_PATH)/chat-ril | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
endif

ifneq ($(AP_MODEM_CDMA_BLDSRC),1)
file := $(TARGET_OUT_EXECUTABLES)/pppd-ril
$(file) : $(LOCAL_PATH)/pppd-ril | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
endif

file := $(TARGET_OUT_ETC)/ppp/peers/pppd-ril.options
$(file) : $(LOCAL_PATH)/pppd-ril.options | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)

