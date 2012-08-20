# Call this first so apn list is actually copied
$(call inherit-product, vendor/ev/config/gsm.mk)

$(call inherit-product, device/htc/flyer/full_flyer.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME    := ev_flyer
PRODUCT_BRAND   := HTC
PRODUCT_DEVICE  := flyer
PRODUCT_MODEL   := HTC Flyer P512
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_bravo BUILD_FINGERPRINT=htc_wwe/htc_bravo/bravo:2.3.3/GRI40/96875.1:user/release-keys TARGET_BUILD_TYPE=userdebug BUILD_VERSION_TAGS=release-keys PRIVATE_BUILD_DESC="3.14.405.1 CL96875 release-keys"

#
# Set up the product codename, build version & MOTD.
#
PRODUCT_CODENAME := Turba
PRODUCT_VERSION_DEVICE_SPECIFIC := p7

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Flyer7 for your HTC Flyer\nPlease visit us at drewgaren.com\n------------------------------------------------\n"

# Copy compatible bootanimation
PRODUCT_COPY_FILES += \
    vendor/ev/prebuilt/wvga/media/bootanimation.zip:system/media/bootanimation.zip
#    device/htc/passion/extras/bootanimation_passion_ics.zip:system/media/bootanimation.zip

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += vendor/ev/overlay/hot_reboot
