#
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

DEVICE_PACKAGE_OVERLAYS := \
    device/moto/wingray/overlay

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

include frameworks/base/build/tablet-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    device/moto/wingray/init.stingray.rc:root/init.stingray.rc \
    device/moto/wingray/init.stingray.usb.rc:root/init.stingray.usb.rc \
    device/moto/wingray/ueventd.stingray.rc:root/ueventd.stingray.rc \

ifneq ($(TARGET_PREBUILT_WIFI_MODULE),)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_WIFI_MODULE):system/lib/modules/bcm4329.ko
endif

PRODUCT_COPY_FILES += \
    device/moto/wingray/mXT1386_08_AA.bin:system/etc/firmware/mXT1386_08_AA.bin \
    device/moto/wingray/mXT1386_08_E1.bin:system/etc/firmware/mXT1386_08_E1.bin \
    device/moto/wingray/mXT1386_09_AA.bin:system/etc/firmware/mXT1386_09_AA.bin \
    device/moto/wingray/mXT1386_10_AA.bin:system/etc/firmware/mXT1386_10_AA.bin \
    device/moto/wingray/mXT1386_10_FF.bin:system/etc/firmware/mXT1386_10_FF.bin

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_COPY_FILES += \
        device/moto/wingray/vold.fstab:system/etc/vold.fstab \
        device/moto/wingray/qtouch-touchscreen.idc:system/usr/idc/qtouch-touchscreen.idc \
        device/moto/wingray/cpcap-key.kl:system/usr/keylayout/cpcap-key.kl \
        device/moto/wingray/cpcap-key.kcm:system/usr/keychars/cpcap-key.kcm \
        device/moto/wingray/stingray-keypad.kl:system/usr/keylayout/stingray-keypad.kl \
        device/moto/wingray/stingray-keypad.kcm:system/usr/keychars/stingray-keypad.kcm

PRODUCT_PACKAGES := \
    camera.stingray \
    sensors.stingray \
    lights.stingray \
    audio.primary.stingray \
    audio.a2dp.default \
    audio_policy.stingray \
    librs_jni \
    make_ext4fs \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory \
    whisperd

PRODUCT_CHARACTERISTICS := tablet

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# media config xml file
PRODUCT_COPY_FILES += \
    device/moto/wingray/media_profiles.xml:system/etc/media_profiles.xml

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \

# inherit from the non-open-source side, if present
ifneq ($(filter trygon trygon_l10n calgon full_stingray tyranid stingray,$(TARGET_PRODUCT)),)
$(call inherit-product-if-exists, vendor/moto/stingray/stingray-vendor.mk)
else
$(call inherit-product-if-exists, vendor/moto/stingray/wingray-vendor.mk)
endif

WIFI_BAND := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)
