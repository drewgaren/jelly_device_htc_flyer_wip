#
# Copyright (C) 2011 The CyanogenMod Project
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
# UPDATED FOR FLYER JELLYBUILDS

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device

PRODUCT_COPY_FILES += device/htc/flyer/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/flyer/ramdisk/init.flyer.rc:root/init.flyer.rc \
    device/htc/flyer/ramdisk/ueventd.flyer.rc:root/ueventd.flyer.rc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/flyer/ace-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/flyer/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/flyer/voicemail-conf.xml:system/etc/voicemail-conf.xml

# GPS / Lights / Sensors
PRODUCT_PACKAGES += \
    gps.flyer \
    lights.flyer \
    sensors.flyer

# icu files
PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/usr/icu/icudt48l.dat:system/usr/icu/icudt48l.dat 
    
# idc files
PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/usr/idc/Ntrig-Pen-touchscreen-v2.idc:system/usr/idc/Ntrig-Pen-touchscreen-v2.idc \
    device/htc/flyer/prebuilt/usr/idc/Ntrig-Pen-touchscreen.idc:system/usr/idc/Ntrig-Pen-touchscreen.idc \
    device/htc/flyer/prebuilt/usr/idc/Ntrig-touchscreen.idc:system/usr/idc/Ntrig-touchscreen.idc \
    device/htc/flyer/prebuilt/usr/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    device/htc/flyer/prebuilt/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/flyer/prebuilt/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc 

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/usr/keychars/atmel-touchscreen.kcm:system/usr/keychars/atmel-touchscreen.kcm \
    device/htc/flyer/prebuilt/usr/keychars/BT_HID.kcm.bin:system/usr/keychars/sBT_HID.kcm.bin \
    device/htc/flyer/prebuilt/usr/keychars/elan-touchscreen.kcm:system/usr/keychars/elan-touchscreen.kcm \
	device/htc/flyer/prebuilt/usr/keychars/express-keypad-v0.kcm:system/usr/keychars/express-keypad-v0.kcm \
    device/htc/flyer/prebuilt/usr/keychars/express-keypad-v0.kcm.bin:system/usr/keychars/express-keypad-v0.kcm.bin \
    device/htc/flyer/prebuilt/usr/keychars/express-keypad.kcm.bin:system/usr/keychars/express-keypad.kcm.bin \
	device/htc/flyer/prebuilt/usr/keychars/flyer-keypad-v0.kcm:system/usr/keychars/flyer-keypad-v0.kcm \
    device/htc/flyer/prebuilt/usr/keychars/flyer-keypad-v0.kcm.bin:system/usr/keychars/flyer-keypad-v0.kcm.bin \
    device/htc/flyer/prebuilt/usr/keychars/flyer-keypad.kcm.bin:system/usr/keychars/flyer-keypad.kcm.bin \
	device/htc/flyer/prebuilt/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/flyer/prebuilt/usr/keychars/pyramid-keypad.kcm:system/usr/keychars/pyramid-keypad.kcm \
    device/htc/flyer/prebuilt/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
	device/htc/flyer/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/flyer/prebuilt/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/flyer/prebuilt/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
	device/htc/flyer/prebuilt/usr/keychars/synaptics-rmi-touchscreen.kcm:system/usr/keychars/synaptics-rmi-touchscreen.kcm \
    device/htc/flyer/prebuilt/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

# akmd
PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/akmd:system/bin/akmd

# media configs
PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/media_codecs.xml:system/etc/media_codecs.xml \
    device/htc/flyer/prebuilt/audio_policy.conf:system/etc/audio_policy.conf

# audio prebuilts
PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/etc/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/flyer/prebuilt/etc/AIC3254_REG_DualMic_XB.csv:system/etc/AIC3254_REG_DualMic_XB.csv \
    device/htc/flyer/prebuilt/etc/AIC3254_REG_DualMic_XC.csv:system/etc/AIC3254_REG_DualMic_XC.csv \
    device/htc/flyer/prebuilt/etc/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/flyer/prebuilt/etc/AIC3254_REG_DualMic.txt:system/etc/AIC3254_REG_DualMic.txt \
    device/htc/flyer/prebuilt/etc/AIC3254_REG_XD.csv:system/etc/AIC3254_REG_XD.csv \
    device/htc/flyer/prebuilt/etc/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/flyer/prebuilt/etc/HP_Audio.csv:system/etc/HP_Audio.csv \
    device/htc/flyer/prebuilt/etc/HP_Video.csv:system/etc/HP_Video.csv \
    device/htc/flyer/prebuilt/etc/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/flyer/prebuilt/etc/AIC3254_REG.csv:system/etc/AIC3254_REG.csv
    

# EGL
PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/egl/egl.cfg:system/lib/egl/egl.cfg \
    device/htc/flyer/prebuilt/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/htc/flyer/prebuilt/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/htc/flyer/prebuilt/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/htc/flyer/prebuilt/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/htc/flyer/prebuilt/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so

#lib
PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/lib/libaudioalsa.so:system/lib/libaudioalsa.so \
    device/htc/flyer/prebuilt/lib/libC2D2.so:system/lib/libC2D2.so \
    device/htc/flyer/prebuilt/lib/libcamera_client.so:system/lib/libcamera_client.so \
    device/htc/flyer/prebuilt/lib/libcamera.so:system/lib/libcamera.so \
    device/htc/flyer/prebuilt/lib/libcameraface.so:system/lib/libcameraface.so \
    device/htc/flyer/prebuilt/lib/libcamerapp.so:system/lib/libcamerapp.so \
    device/htc/flyer/prebuilt/lib/libcameraservice.so:system/lib/libcameraservice.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k4e1gx_default_video.so:system/lib/libchromatix_s5k4e1gx_default_video.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k4e1gx_preview.so:system/lib/libchromatix_s5k4e1gx_preview.so \
    device/htc/flyer/prebuilt/lib/libdrmframework_jni.so:system/lib/libdrmframework_jni.so \
    device/htc/flyer/prebuilt/lib/libdrmframework.so:system/lib/libdrmframework.so \
    device/htc/flyer/prebuilt/lib/libdrmwvmplugin.so:system/lib/libdrmwvmplugin.so \
    device/htc/flyer/prebuilt/lib/libEGL_adreno200.so:system/lib/libEGL_adreno200.so \
    device/htc/flyer/prebuilt/lib/libEGL.so:system/lib/libEGL.so \
    device/htc/flyer/prebuilt/lib/libfilterpack_facedetect.so:system/lib/libfilterpack_facedetect.so \
    device/htc/flyer/prebuilt/lib/libfrsdk.so:system/lib/libfrsdk.so \
    device/htc/flyer/prebuilt/lib/libgemini.so:system/lib/libgemini.so \
    device/htc/flyer/prebuilt/lib/libGLES_android.so:system/lib/libGLES_android.so \
    device/htc/flyer/prebuilt/lib/libGLESv1_CM_adreno200.so:system/lib/libGLESv1_CM_adreno200.so \
    device/htc/flyer/prebuilt/lib/libGLESv2_adreno200.so:system/lib/libGLESv2_adreno200.so \
    device/htc/flyer/prebuilt/lib/libgoogle_recognizer_jni.so:system/lib/libgoogle_recognizer_jni.so \
    device/htc/flyer/prebuilt/lib/libgsl.so:system/lib/libgsl.so \
    device/htc/flyer/prebuilt/lib/libhtc_acoustic.so:system/lib/libhtc_acoustic.so \
    device/htc/flyer/prebuilt/lib/libhtc_ril.so:system/lib/libhtc_ril.so \
    device/htc/flyer/prebuilt/lib/libmmipl.so:system/lib/libmmipl.so \
    device/htc/flyer/prebuilt/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    device/htc/flyer/prebuilt/lib/liboemcamera.so:system/lib/liboemcamera.so \
    device/htc/flyer/prebuilt/lib/libOlaEngine.so:system/lib/libOlaEngine.so \
    device/htc/flyer/prebuilt/lib/libOpenVG.so:system/lib/libOpenVG.so \
    device/htc/flyer/prebuilt/lib/libpatts_engine_jni_api.so:system/lib/libpatts_engine_jni_api.so \
	device/htc/flyer/prebuilt/lib/libq3dtools_adreno200.so:system/lib/libq3dtools_adreno200.so \
    device/htc/flyer/prebuilt/lib/libreference-ril.so:system/lib/libreference-ril.so \
    device/htc/flyer/prebuilt/lib/libril.so:system/lib/libril.so \
	device/htc/flyer/prebuilt/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    device/htc/flyer/prebuilt/lib/libspeexwrapper.so:system/lib/libspeexwrapper.so \
    device/htc/flyer/prebuilt/lib/libstagefrighthw.so:system/lib/libstagefrighthw.so \
	device/htc/flyer/prebuilt/lib/libv8.so:system/lib/libv8.so \
    device/htc/flyer/prebuilt/lib/libvideochat_jni.so:system/lib/libvideochat_jni.so \
    device/htc/flyer/prebuilt/lib/libvideochat_stabilize.so:system/lib/libvideochat_stabilize.so \
	device/htc/flyer/prebuilt/lib/libvoicesearch.so:system/lib/libvoicesearch.so \
    device/htc/flyer/prebuilt/lib/libvorbisencoder.so:system/lib/libvorbisencoder.so \
    device/htc/flyer/prebuilt/lib/libwvdrm_L3.so:system/lib/libwvdrm_L3.so \
	device/htc/flyer/prebuilt/lib/libwvm.so:system/lib/libwvm.so \
    device/htc/flyer/prebuilt/lib/libWVStreamControlAPI_L3.so:system/lib/libWVStreamControlAPI_L3.so 

# HW
#PRODUCT_COPY_FILES += \
#    device/htc/flyer/prebuilt/hw/audio.primary.msm7x30.so:system/lib/hw/audio.primary.msm7x30.so
#    device/htc/flyer/prebuilt/hw/copybit.msm7x30.so:system/lib/hw/copybit.msm7x30.so
#    device/htc/flyer/prebuilt/hw/camera.msm7x30.so:system/lib/hw/camera.msm7x30.so 


# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/flyer/prebuilt/usr/keylayout/BT_HID.kl:system/usr/keylayout/BT_HID.kl \
    device/htc/flyer/prebuilt/usr/keylayout/express-keypad-v0.kl:system/usr/keylayout/express-keypad-v0.kl \
    device/htc/flyer/prebuilt/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/flyer/prebuilt/usr/keylayout/express-keypad.kl:system/usr/keylayout/express-keypad.kl \
    device/htc/flyer/prebuilt/usr/keylayout/express-keypad.kl:system/usr/keylayout/express-keypad.kl \
    device/htc/flyer/prebuilt/usr/keylayout/flyer-keypad-v0.kl:system/usr/keylayout/flyer-keypad-v0.kl \
    device/htc/flyer/prebuilt/usr/keylayout/flyer-keypad.kl:system/usr/keylayout/flyer-keypad.kl \
    device/htc/flyer/prebuilt/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/htc/flyer/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/flyer/prebuilt/usr/keylayout/pen-keypad-v0.kl:system/usr/keylayout/pen-keypad-v0.kl \
    device/htc/flyer/prebuilt/usr/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    device/htc/flyer/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/flyer/prebuilt/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/htc/flyer/prebuilt/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    device/htc/flyer/prebuilt/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/htc/flyer/prebuilt/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/htc/flyer/prebuilt/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/htc/flyer/prebuilt/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/htc/flyer/prebuilt/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/htc/flyer/prebuilt/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl 

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/flyer/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/flyer/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/flyer/dsp/AIC3254_REG_DualMic.txt:system/etc/AIC3254_REG_DualMic.txt \
    device/htc/flyer/dsp/AIC3254_REG_DualMic_XB.csv:system/etc/AIC3254_REG_DualMic_XB.csv \
    device/htc/flyer/dsp/AIC3254_REG_DualMic_XC.csv:system/etc/AIC3254_REG_DualMic_XC.csv \
    device/htc/flyer/dsp/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/flyer/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/flyer/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/flyer/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/flyer/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/flyer/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/flyer/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/flyer/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/flyer/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/flyer/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/flyer/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/flyer/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/flyer/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/flyer/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/flyer/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/flyer/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/flyer/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/flyer/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt
 
PRODUCT_COPY_FILES += \
    device/htc/flyer/vold.fstab:system/etc/vold.fstab

#PRODUCT_COPY_FILES += \
#    device/htc/flyer/prebuilt/lib/libcamera.so:obj/lib/libcamera.so \
#    device/htc/flyer/prebuilt/hw/camera.msm7x30.so:obj/lib/camera.msm7x30.so

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/flyer/media_profiles.xml:system/etc/media_profiles.xml

# Kernel modules
PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/bcmdhd.ko:system/lib/modules/bcmdhd.ko

#wireless firmware copy it manually because bcmdhd for bcm4329 isn't working right
PRODUCT_COPY_FILES += \
    device/htc/flyer/firmware/a225_pfp.fw:system/etc/firmware/a225_pfp.fw \
    device/htc/flyer/firmware/a225_pm4.fw:system/etc/firmware/a225_pm4.fw \
    device/htc/flyer/firmware/a225p5_pm4.fw:system/etc/firmware/a225p5_pm4.fw \
    device/htc/flyer/firmware/a300_pfp.fw:system/etc/firmware/a300_pfp.fw \
    device/htc/flyer/firmware/a300_pm4.fw:system/etc/firmware/a300_pm4.fw \
    device/htc/flyer/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/flyer/firmware/BCM4329B1_002.002.023.0589.0632.hcd:system/etc/firmware/BCM4329B1_002.002.023.0589.0632.hcd \
    device/htc/flyer/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/flyer/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/flyer/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcmdhd.bin \
    device/htc/flyer/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcmdhd_apsta.bin \
    device/htc/flyer/prebuilt/vendor/firmware/fw_bcm4329.bin:system/vendor/firmware/fw_bcmdhd.bin \
    device/htc/flyer/prebuilt/vendor/firmware/fw_bcm4329_apsta.bin:system/vendor/firmware/fw_bcmdhd_apsta.bin \
    device/htc/flyer/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/flyer/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/htc/flyer/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/flyer/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/flyer/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/flyer/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/flyer/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/flyer/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/flyer/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/flyer/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
    device/htc/flyer/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/flyer/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw 

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/flyer/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/libaudioalsa.so:obj/lib/libaudioalsa.so

# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# HTC Audio
$(call inherit-product, device/htc/flyer/media_a1026.mk)
$(call inherit-product, device/htc/flyer/media_htcaudio.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/htc/flyer/flyer-vendor.mk)
