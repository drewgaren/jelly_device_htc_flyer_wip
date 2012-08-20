$(call inherit-product, device/htc/flyer/full_flyer.mk)

PRODUCT_RELEASE_NAME := Flyer

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_NAME := cm_flyer
PRODUCT_DEVICE := flyer

