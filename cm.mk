# Release name
PRODUCT_RELEASE_NAME := XOOM

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/moto/wingray/full_wingray.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := wingray
PRODUCT_NAME := cm_wingray
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Xoom

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=wingray BUILD_ID=HTK75D BUILD_DISPLAY_ID=HTK75D BUILD_FINGERPRINT="motorola/tervigon/wingray:3.2.1/HTK75D/190830:user/release-keys" PRIVATE_BUILD_DESC="tervigon-user 3.2.1 HTK75D 190830 release-keys"
