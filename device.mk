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

# Inherit qcom proprietary blobs
$(call inherit-product, vendor/qcom/proprietary/qcom-vendor.mk)

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
    device/htc/flyer/prebuilt/lib/soundfx/libbeatsbass.so:system/lib/soundfx/libbeatsbass.so \
    device/htc/flyer/prebuilt/lib/liba2dp.so:system/lib/liba2dp.so \
    device/htc/flyer/prebuilt/lib/libaactag.so:system/lib/libaactag.so \
    device/htc/flyer/prebuilt/lib/libabl.so:system/lib/libabl.so \
    device/htc/flyer/prebuilt/lib/libabloem.so:system/lib/libabloem.so \
    device/htc/flyer/prebuilt/lib/libacc.so:system/lib/libacc.so \
    device/htc/flyer/prebuilt/lib/libaddrsdetection.so:system/lib/libaddrsdetection.so \
    device/htc/flyer/prebuilt/lib/libalbum_util2.so:system/lib/libalbum_util2.so \
    device/htc/flyer/prebuilt/lib/libalbum_util2e.so:system/lib/libalbum_util2e.so \
    device/htc/flyer/prebuilt/lib/libandroid_simlock.so:system/lib/libandroid_simlock.so \
    device/htc/flyer/prebuilt/lib/libaricentomxplugin.so:system/lib/libaricentomxplugin.so \
    device/htc/flyer/prebuilt/lib/libaudcal.so:system/lib/libaudcal.so \
    device/htc/flyer/prebuilt/lib/libaudcal_nel.so:system/lib/libaudcal_nel.so \
    device/htc/flyer/prebuilt/lib/libaudcalwb.so:system/lib/libaudcalwb.so \
    device/htc/flyer/prebuilt/lib/libAudioTrimmer.so:system/lib/libAudioTrimmer.so \
    device/htc/flyer/prebuilt/lib/libbeatscorehtc.so:system/lib/libbeatscorehtc.so \
    device/htc/flyer/prebuilt/lib/libbt-aptx-4.0.3.so:system/lib/libbt-aptx-4.0.3.so \
    device/htc/flyer/prebuilt/lib/libbullet.so:system/lib/libbullet.so \
    device/htc/flyer/prebuilt/lib/libcapsjava.so:system/lib/libcapsjava.so \
    device/htc/flyer/prebuilt/lib/libCBSDKTool.so:system/lib/libCBSDKTool.so \
    device/htc/flyer/prebuilt/lib/libcentralZoomTransition.so:system/lib/libcentralZoomTransition.so \
    device/htc/flyer/prebuilt/lib/libChange.so:system/lib/libChange.so \
    device/htc/flyer/prebuilt/lib/libchromatix_imx105_default_video.so:system/lib/libchromatix_imx105_default_video.so \
    device/htc/flyer/prebuilt/lib/libchromatix_imx105_preview.so:system/lib/libchromatix_imx105_preview.so \
    device/htc/flyer/prebuilt/lib/libchromatix_imx105_zsl.so:system/lib/libchromatix_imx105_zsl.so \
    device/htc/flyer/prebuilt/lib/libchromatix_mt9d015_default_video.so:system/lib/libchromatix_mt9d015_default_video.so \
    device/htc/flyer/prebuilt/lib/libchromatix_mt9d015_default_zsl.so:system/lib/libchromatix_mt9d015_default_zsl.so \
    device/htc/flyer/prebuilt/lib/libchromatix_mt9d015_preview.so:system/lib/libchromatix_mt9d015_preview.so \
    device/htc/flyer/prebuilt/lib/libchromatix_ov8810_default_video.so:system/lib/libchromatix_ov8810_default_video.so \
    device/htc/flyer/prebuilt/lib/libchromatix_ov8810_preview.so:system/lib/libchromatix_ov8810_preview.so \
    device/htc/flyer/prebuilt/lib/libchromatix_ov8830_default_video.so:system/lib/libchromatix_ov8830_default_video.so \
    device/htc/flyer/prebuilt/lib/libchromatix_ov8830_hfr.so:system/lib/libchromatix_ov8830_hfr.so \
    device/htc/flyer/prebuilt/lib/libchromatix_ov8830_preview.so:system/lib/libchromatix_ov8830_preview.so \
    device/htc/flyer/prebuilt/lib/libchromatix_ov8830_zsl.so:system/lib/libchromatix_ov8830_zsl.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k3h1gx_default_video.so:system/lib/libchromatix_s5k3h1gx_default_video.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k3h1gx_hfr.so:system/lib/libchromatix_s5k3h1gx_hfr.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k3h1gx_preview.so:system/lib/libchromatix_s5k3h1gx_preview.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k3h1gx_zsl.so:system/lib/libchromatix_s5k3h1gx_zsl.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k3h2yx_default_video.so:system/lib/libchromatix_s5k3h2yx_default_video.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k3h2yx_hfr.so:system/lib/libchromatix_s5k3h2yx_hfr.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k3h2yx_preview.so:system/lib/libchromatix_s5k3h2yx_preview.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k3h2yx_zsl.so:system/lib/libchromatix_s5k3h2yx_zsl.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k4e5yx_default_video.so:system/lib/libchromatix_s5k4e5yx_default_video.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k4e5yx_hdr.so:system/lib/libchromatix_s5k4e5yx_hdr.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k4e5yx_hfr.so:system/lib/libchromatix_s5k4e5yx_hfr.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k4e5yx_hfr_4x.so:system/lib/libchromatix_s5k4e5yx_hfr_4x.so \
    device/htc/flyer/prebuilt/lib/libchromatix_s5k4e5yx_preview.so:system/lib/libchromatix_s5k4e5yx_preview.so \
    device/htc/flyer/prebuilt/lib/libcontentZoomTransition.so:system/lib/libcontentZoomTransition.so \
    device/htc/flyer/prebuilt/lib/libcpt9.so:system/lib/libcpt9.so \
    device/htc/flyer/prebuilt/lib/libcpt9core.so:system/lib/libcpt9core.so \
    device/htc/flyer/prebuilt/lib/libcpt9provider.so:system/lib/libcpt9provider.so \
    device/htc/flyer/prebuilt/lib/libcubicRotateTransition.so:system/lib/libcubicRotateTransition.so \
    device/htc/flyer/prebuilt/lib/libdec.so:system/lib/libdec.so \
    device/htc/flyer/prebuilt/lib/libdice_ml.so:system/lib/libdice_ml.so \
    device/htc/flyer/prebuilt/lib/libdll.so:system/lib/libdll.so \
    device/htc/flyer/prebuilt/lib/libdsi_netctrl.so:system/lib/libdsi_netctrl.so \
    device/htc/flyer/prebuilt/lib/libdsprofile.so:system/lib/libdsprofile.so \
    device/htc/flyer/prebuilt/lib/libdss.so:system/lib/libdss.so \
    device/htc/flyer/prebuilt/lib/libdsutils.so:system/lib/libdsutils.so \
    device/htc/flyer/prebuilt/lib/libdumppcm.so:system/lib/libdumppcm.so \
    device/htc/flyer/prebuilt/lib/libDxAndroidSpecific.so:system/lib/libDxAndroidSpecific.so \
    device/htc/flyer/prebuilt/lib/libDxDrmJava.so:system/lib/libDxDrmJava.so \
    device/htc/flyer/prebuilt/lib/libDxPlatformUtils.so:system/lib/libDxPlatformUtils.so \
    device/htc/flyer/prebuilt/lib/libfacelock_jni.so:system/lib/libfacelock_jni.so \
    device/htc/flyer/prebuilt/lib/libflint_engine_jni_api.so:system/lib/libflint_engine_jni_api.so \
    device/htc/flyer/prebuilt/lib/libfuse.so:system/lib/libfuse.so \
    device/htc/flyer/prebuilt/lib/libgcomm_jni.so:system/lib/libgcomm_jni.so \
    device/htc/flyer/prebuilt/lib/libGLESv2_dbg.so:system/lib/libGLESv2_dbg.so \
    device/htc/flyer/prebuilt/lib/libGLVideoPlayback.so:system/lib/libGLVideoPlayback.so \
    device/htc/flyer/prebuilt/lib/libhciutils.so:system/lib/libhciutils.so \
    device/htc/flyer/prebuilt/lib/libHTC_DIS.so:system/lib/libHTC_DIS.so \
    device/htc/flyer/prebuilt/lib/libhtc_fuse.so:system/lib/libhtc_fuse.so \
    device/htc/flyer/prebuilt/lib/libhtc_ril_switch.so:system/lib/libhtc_ril_switch.so \
    device/htc/flyer/prebuilt/lib/libhtcanipluginmanager.so:system/lib/libhtcanipluginmanager.so \
    device/htc/flyer/prebuilt/lib/libhtcAVIParser.so:system/lib/libhtcAVIParser.so \
    device/htc/flyer/prebuilt/lib/libhtcbitmapfactory.so:system/lib/libhtcbitmapfactory.so \
    device/htc/flyer/prebuilt/lib/libhtccamera.so:system/lib/libhtccamera.so \
    device/htc/flyer/prebuilt/lib/libhtcpainting.so:system/lib/libhtcpainting.so \
    device/htc/flyer/prebuilt/lib/libhtcqxdm2sd.so:system/lib/libhtcqxdm2sd.so \
    device/htc/flyer/prebuilt/lib/libhtcreader.so:system/lib/libhtcreader.so \
    device/htc/flyer/prebuilt/lib/libhtcsnapbooth.so:system/lib/libhtcsnapbooth.so \
    device/htc/flyer/prebuilt/lib/libhtcsunny2engine.so:system/lib/libhtcsunny2engine.so \
    device/htc/flyer/prebuilt/lib/libhtcsunnyengine.so:system/lib/libhtcsunnyengine.so \
    device/htc/flyer/prebuilt/lib/libhtctranscode.so:system/lib/libhtctranscode.so \
    device/htc/flyer/prebuilt/lib/libicule.so:system/lib/libicule.so \
    device/htc/flyer/prebuilt/lib/libiculx.so:system/lib/libiculx.so \
    device/htc/flyer/prebuilt/lib/libid3tag.so:system/lib/libid3tag.so \
    device/htc/flyer/prebuilt/lib/libidl.so:system/lib/libidl.so \
    device/htc/flyer/prebuilt/lib/libjUPnPCP.so:system/lib/libjUPnPCP.so \
    device/htc/flyer/prebuilt/lib/libLaputaEngine.so:system/lib/libLaputaEngine.so \
    device/htc/flyer/prebuilt/lib/libLaputaLbJni.so:system/lib/libLaputaLbJni.so \
    device/htc/flyer/prebuilt/lib/libLaputaLbProviderJni.so:system/lib/libLaputaLbProviderJni.so \
    device/htc/flyer/prebuilt/lib/libLaputaLogJni.so:system/lib/libLaputaLogJni.so \
    device/htc/flyer/prebuilt/lib/libloc_api-rpc.so:system/lib/libloc_api-rpc.so \
    device/htc/flyer/prebuilt/lib/liblz.so:system/lib/liblz.so \
    device/htc/flyer/prebuilt/lib/liblzo.so:system/lib/liblzo.so \
    device/htc/flyer/prebuilt/lib/libmediatranscoder_jni.so:system/lib/libmediatranscoder_jni.so \
    device/htc/flyer/prebuilt/lib/libmllite.so:system/lib/libmllite.so \
    device/htc/flyer/prebuilt/lib/libmlplatform.so:system/lib/libmlplatform.so \
    device/htc/flyer/prebuilt/lib/libMLTransition.so:system/lib/libMLTransition.so \
    device/htc/flyer/prebuilt/lib/libmm-abl.so:system/lib/libmm-abl.so \
    device/htc/flyer/prebuilt/lib/libmmcamera_rawchipproc.so:system/lib/libmmcamera_rawchipproc.so \
    device/htc/flyer/prebuilt/lib/libmode10.so:system/lib/libmode10.so \
    device/htc/flyer/prebuilt/lib/libmode10_alpha.so:system/lib/libmode10_alpha.so \
    device/htc/flyer/prebuilt/lib/libmode10_ml.so:system/lib/libmode10_ml.so \
    device/htc/flyer/prebuilt/lib/libmode10_wallpapers.so:system/lib/libmode10_wallpapers.so \
    device/htc/flyer/prebuilt/lib/libmode10fx.so:system/lib/libmode10fx.so \
    device/htc/flyer/prebuilt/lib/libmode10GLES20.so:system/lib/libmode10GLES20.so \
    device/htc/flyer/prebuilt/lib/libmode10GLES20_ml.so:system/lib/libmode10GLES20_ml.so \
    device/htc/flyer/prebuilt/lib/libmode10Graphics.so:system/lib/libmode10Graphics.so \
    device/htc/flyer/prebuilt/lib/libmode10Graphics_alpha.so:system/lib/libmode10Graphics_alpha.so \
    device/htc/flyer/prebuilt/lib/libmode10Network.so:system/lib/libmode10Network.so \
    device/htc/flyer/prebuilt/lib/libmpl.so:system/lib/libmpl.so \
    device/htc/flyer/prebuilt/lib/libmpl_jni.so:system/lib/libmpl_jni.so \
    device/htc/flyer/prebuilt/lib/libnativedocviewer.so:system/lib/libnativedocviewer.so \
    device/htc/flyer/prebuilt/lib/libnetmgr.so:system/lib/libnetmgr.so \
    device/htc/flyer/prebuilt/lib/libnotes_jni.so:system/lib/libnotes_jni.so \
    device/htc/flyer/prebuilt/lib/libnotesprovider_jni.so:system/lib/libnotesprovider_jni.so \
    device/htc/flyer/prebuilt/lib/libOlaEngineNew.so:system/lib/libOlaEngineNew.so \
    device/htc/flyer/prebuilt/lib/liboma-drm1-fs.so:system/lib/liboma-drm1-fs.so \
    device/htc/flyer/prebuilt/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    device/htc/flyer/prebuilt/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    device/htc/flyer/prebuilt/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    device/htc/flyer/prebuilt/lib/libOmxQcelp13Dec.so:system/lib/libOmxQcelp13Dec.so \
    device/htc/flyer/prebuilt/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    device/htc/flyer/prebuilt/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    device/htc/flyer/prebuilt/lib/libpagecurl.so:system/lib/libpagecurl.so \
    device/htc/flyer/prebuilt/lib/libpdfviewer.so:system/lib/libpdfviewer.so \
    device/htc/flyer/prebuilt/lib/libpicowrapper.so:system/lib/libpicowrapper.so \
    device/htc/flyer/prebuilt/lib/libpng.so:system/lib/libpng.so \
    device/htc/flyer/prebuilt/lib/libpolarisoffice_Clipboard.so:system/lib/libpolarisoffice_Clipboard.so \
    device/htc/flyer/prebuilt/lib/libposteffect.so:system/lib/libposteffect.so \
    device/htc/flyer/prebuilt/lib/libpphwr.so:system/lib/libpphwr.so \
    device/htc/flyer/prebuilt/lib/libpphwrcore.so:system/lib/libpphwrcore.so \
    device/htc/flyer/prebuilt/lib/libpphwrprovider.so:system/lib/libpphwrprovider.so \
    device/htc/flyer/prebuilt/lib/libQcomUI.so:system/lib/libQcomUI.so \
    device/htc/flyer/prebuilt/lib/libqdp.so:system/lib/libqdp.so \
    device/htc/flyer/prebuilt/lib/libqmi.so:system/lib/libqmi.so \
    device/htc/flyer/prebuilt/lib/libqmiservices.so:system/lib/libqmiservices.so \
    device/htc/flyer/prebuilt/lib/libreaderdrm.so:system/lib/libreaderdrm.so \
    device/htc/flyer/prebuilt/lib/librecentappZoomTransition.so:system/lib/librecentappZoomTransition.so \
    device/htc/flyer/prebuilt/lib/librfcommutils.so:system/lib/librfcommutils.so \
    device/htc/flyer/prebuilt/lib/libscalado_htcalbum2.so:system/lib/libscalado_htcalbum2.so \
    device/htc/flyer/prebuilt/lib/libscaladoapi.so:system/lib/libscaladoapi.so \
    device/htc/flyer/prebuilt/lib/libscaladoutil.so:system/lib/libscaladoutil.so \
    device/htc/flyer/prebuilt/lib/libScreenshotUtil.so:system/lib/libScreenshotUtil.so \
    device/htc/flyer/prebuilt/lib/libsmith.so:system/lib/libsmith.so \
    device/htc/flyer/prebuilt/lib/libspeex_sh.so:system/lib/libspeex_sh.so \
    device/htc/flyer/prebuilt/lib/libsrscorehtc.so:system/lib/libsrscorehtc.so \
    device/htc/flyer/prebuilt/lib/libsrsprocessing.so:system/lib/libsrsprocessing.so \
    device/htc/flyer/prebuilt/lib/libstabilize.so:system/lib/libstabilize.so \
    device/htc/flyer/prebuilt/lib/libstream_core.so:system/lib/libstream_core.so \
    device/htc/flyer/prebuilt/lib/libsvoxtts.so:system/lib/libsvoxtts.so \
    device/htc/flyer/prebuilt/lib/libswipeCubicTransition.so:system/lib/libswipeCubicTransition.so \
    device/htc/flyer/prebuilt/lib/libswiqibmpcnv.so:system/lib/libswiqibmpcnv.so \
    device/htc/flyer/prebuilt/lib/libt9.so:system/lib/libt9.so \
    device/htc/flyer/prebuilt/lib/libtipsani.so:system/lib/libtipsani.so \
    device/htc/flyer/prebuilt/lib/libtranscodemanager.so:system/lib/libtranscodemanager.so \
    device/htc/flyer/prebuilt/lib/libTRIM.so:system/lib/libTRIM.so \
    device/htc/flyer/prebuilt/lib/libttssynthproxy.so:system/lib/libttssynthproxy.so \
    device/htc/flyer/prebuilt/lib/libtunein.dec.so:system/lib/libtunein.dec.so \
    device/htc/flyer/prebuilt/lib/libtunein.ffmpeg.so:system/lib/libtunein.ffmpeg.so \
    device/htc/flyer/prebuilt/lib/libtunein.mms.so:system/lib/libtunein.mms.so \
    device/htc/flyer/prebuilt/lib/libusbnetjni.so:system/lib/libusbnetjni.so \
    device/htc/flyer/prebuilt/lib/libvoAACDec.so:system/lib/libvoAACDec.so \
    device/htc/flyer/prebuilt/lib/libvoAMRNBDec.so:system/lib/libvoAMRNBDec.so \
    device/htc/flyer/prebuilt/lib/libvoAMRWBDec.so:system/lib/libvoAMRWBDec.so \
    device/htc/flyer/prebuilt/lib/libvoAndroid.so:system/lib/libvoAndroid.so \
    device/htc/flyer/prebuilt/lib/libvoASFFR.so:system/lib/libvoASFFR.so \
    device/htc/flyer/prebuilt/lib/libvoAVIFR.so:system/lib/libvoAVIFR.so \
    device/htc/flyer/prebuilt/lib/libvoFLVFR.so:system/lib/libvoFLVFR.so \
    device/htc/flyer/prebuilt/lib/libvoH264Dec.so:system/lib/libvoH264Dec.so \
    device/htc/flyer/prebuilt/lib/libvoH264Dec_m.so:system/lib/libvoH264Dec_m.so \
    device/htc/flyer/prebuilt/lib/libvoLog.so:system/lib/libvoLog.so \
    device/htc/flyer/prebuilt/lib/libvomemedia.so:system/lib/libvomemedia.so \
    device/htc/flyer/prebuilt/lib/libvoMMCCRRS.so:system/lib/libvoMMCCRRS.so \
    device/htc/flyer/prebuilt/lib/libvoMMPlay.so:system/lib/libvoMMPlay.so \
    device/htc/flyer/prebuilt/lib/libvoMP3Dec.so:system/lib/libvoMP3Dec.so \
    device/htc/flyer/prebuilt/lib/libvoMPEG4Dec.so:system/lib/libvoMPEG4Dec.so \
    device/htc/flyer/prebuilt/lib/libvoOMXME.so:system/lib/libvoOMXME.so \
    device/htc/flyer/prebuilt/lib/libvoOMXOne.so:system/lib/libvoOMXOne.so \
    device/htc/flyer/prebuilt/lib/libvoPackUV.so:system/lib/libvoPackUV.so \
    device/htc/flyer/prebuilt/lib/libvoPDLog.so:system/lib/libvoPDLog.so \
    device/htc/flyer/prebuilt/lib/libvoSrcPD.so:system/lib/libvoSrcPD.so \
    device/htc/flyer/prebuilt/lib/libvoSrcRTSP.so:system/lib/libvoSrcRTSP.so \
    device/htc/flyer/prebuilt/lib/libvoVC1Dec.so:system/lib/libvoVC1Dec.so \
    device/htc/flyer/prebuilt/lib/libvoVidDec.so:system/lib/libvoVidDec.so \
    device/htc/flyer/prebuilt/lib/libvoWMADec.so:system/lib/libvoWMADec.so \
    device/htc/flyer/prebuilt/lib/libvoWMVDec.so:system/lib/libvoWMVDec.so \
    device/htc/flyer/prebuilt/lib/libwebkitaccel.so:system/lib/libwebkitaccel.so \
    device/htc/flyer/prebuilt/lib/libwivu.so:system/lib/libwivu.so \
    device/htc/flyer/prebuilt/lib/libwsp.so:system/lib/libwsp.so \
    device/htc/flyer/prebuilt/lib/libwsp_jni.so:system/lib/libwsp_jni.so \
    device/htc/flyer/prebuilt/lib/libwt6bjprndrv.so:system/lib/libwt6bjprndrv.so \
    device/htc/flyer/prebuilt/lib/libwt6docintr.so:system/lib/libwt6docintr.so \
    device/htc/flyer/prebuilt/lib/libwt6docrdr.so:system/lib/libwt6docrdr.so \
    device/htc/flyer/prebuilt/lib/libwt6docxrdr.so:system/lib/libwt6docxrdr.so \
    device/htc/flyer/prebuilt/lib/libwt6epprndrv.so:system/lib/libwt6epprndrv.so \
    device/htc/flyer/prebuilt/lib/libwt6hpprndrv.so:system/lib/libwt6hpprndrv.so \
    device/htc/flyer/prebuilt/lib/libwt6imgrdr.so:system/lib/libwt6imgrdr.so \
    device/htc/flyer/prebuilt/lib/libwt6pdfrdr.so:system/lib/libwt6pdfrdr.so \
    device/htc/flyer/prebuilt/lib/libwt6pptrdr.so:system/lib/libwt6pptrdr.so \
    device/htc/flyer/prebuilt/lib/libwt6pptxrdr.so:system/lib/libwt6pptxrdr.so \
    device/htc/flyer/prebuilt/lib/libwt6prnddi.so:system/lib/libwt6prnddi.so \
    device/htc/flyer/prebuilt/lib/libwt6xlsrdr.so:system/lib/libwt6xlsrdr.so \
    device/htc/flyer/prebuilt/lib/libwt6xlsxrdr.so:system/lib/libwt6xlsxrdr.so \
    device/htc/flyer/prebuilt/lib/libwvdrm.so:system/lib/libwvdrm.so \
    device/htc/flyer/prebuilt/lib/libWVphoneAPI.so:system/lib/libWVphoneAPI.so \
    device/htc/flyer/prebuilt/lib/libWVStreamControlAPI.so:system/lib/libWVStreamControlAPI.so \
    device/htc/flyer/prebuilt/lib/libzoomTransition.so:system/lib/libzoomTransition.so \
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
    device/htc/flyer/prebuilt/lib/libvideochat_stabilize.so:system/lib/libvideochat_stabilize.so \	device/htc/flyer/prebuilt/lib/libvoicesearch.so:system/lib/libvoicesearch.so \
    device/htc/flyer/prebuilt/lib/libvorbisencoder.so:system/lib/libvorbisencoder.so \
    device/htc/flyer/prebuilt/lib/libwvdrm_L3.so:system/lib/libwvdrm_L3.so \
    device/htc/flyer/prebuilt/lib/libwvm.so:system/lib/libwvm.so \
    device/htc/flyer/prebuilt/lib/libWVStreamControlAPI_L3.so:system/lib/libWVStreamControlAPI_L3.so 

# HW
#PRODUCT_COPY_FILES += \
   device/htc/flyer/prebuilt/hw/audio.primary.msm7x30.so:system/lib/hw/audio.primary.msm7x30.so \
    device/htc/flyer/prebuilt/hw/copybit.msm7x30.so:system/lib/hw/copybit.msm7x30.so \
  device/htc/flyer/prebuilt/hw/camera.msm7x30.so:system/lib/hw/camera.msm7x30.so 


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
    device/htc/flyer/dsp/soundimage/Sound_Beats.txt:system/etc/soundimage/Sound_Beats.txt \
    device/htc/flyer/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/flyer/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/flyer/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dolby_A_HP.txt:system/etc/soundimage/Sound_Dolby_A_HP.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dolby_A_SPK.txt:system/etc/soundimage/Sound_Dolby_A_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dolby_V_HP.txt:system/etc/soundimage/Sound_Dolby_V_HP.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dolby_V_SPK.txt:system/etc/soundimage/Sound_Dolby_V_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dualmic_EP.txt:system/etc/soundimage/Sound_Dualmic_EP.txt \
    device/htc/flyer/dsp/soundimage/Sound_Dualmic_SPK.txt:system/etc/soundimage/Sound_Dualmic_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/flyer/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/flyer/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/flyer/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/flyer/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/flyer/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/flyer/dsp/soundimage/Sound_Phone_Original_REC_WB.txt:system/etc/soundimage/Sound_Phone_Original_REC_WB.txt \
    device/htc/flyer/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/flyer/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/flyer/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/flyer/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/flyer/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/flyer/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    device/htc/flyer/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/flyer/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/flyer/dsp/soundimage/Sound_SPK_DUALMIC.txt:system/etc/soundimage/Sound_SPK_DUALMIC.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/flyer/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/flyer/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/flyer/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/flyer/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/flyer/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg \
    device/htc/flyer/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/flyer/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/flyer/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/flyer/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg 

PRODUCT_COPY_FILES += \
    device/htc/flyer/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/lib/libcamera.so:obj/lib/libcamera.so \
    device/htc/flyer/prebuilt/hw/camera.msm7x30.so:obj/lib/camera.msm7x30.so

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/flyer/media_profiles.xml:system/etc/media_profiles.xml

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/flyer/kernel/zImage

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Kernel modules
PRODUCT_COPY_FILES += \
    device/htc/flyer/kernel/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko 
endif

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

PRODUCT_COPY_FILES += \
    device/htc/flyer/prebuilt/libaudioalsa.so:obj/lib/libaudioalsa.so

$(call inherit-product, build/target/product/full_base.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# HTC Audio
$(call inherit-product, device/htc/flyer/media_a1026.mk)
$(call inherit-product, device/htc/flyer/media_htcaudio.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/htc/flyer/flyer-vendor.mk)
