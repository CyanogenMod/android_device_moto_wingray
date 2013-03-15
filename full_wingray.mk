# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for stingray hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Set wifi-only before it's set by generic_no_telephony.mk
PRODUCT_PROPERTY_OVERRIDES += \
        ro.carrier=wifi-only

# Additional settings used in all AOSP builds
PRODUCT_PROPERTY_OVERRIDES := \
    ro.com.android.dateformat=MM-dd-yyyy

# Put en_US first in the list, so make it default.
PRODUCT_LOCALES := en_US

PRODUCT_PACKAGES := \
    libfwdlockengine \
    WAPPushManager

# Get some sounds
$(call inherit-product-if-exists, frameworks/base/data/sounds/AllAudio.mk)

# Get the TTS language packs
$(call inherit-product-if-exists, external/svox/pico/lang/all_pico_languages.mk)

# Get a list of languages.
$(call inherit-product, $(SRC_TARGET_DIR)/product/locales_full.mk)

# Get everything else from the parent package
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)

# Device specific
$(call inherit-product, device/moto/wingray/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_wingray
PRODUCT_DEVICE := wingray
PRODUCT_BRAND := Android
PRODUCT_MODEL := Full Android on Wingray
