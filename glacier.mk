#
# Copyright (C) 2009 The Android Open Source Project
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

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/glacier/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/glacier/init.glacier.rc:root/init.glacier.rc \
    device/htc/vision/ueventd.vision.rc:root/ueventd.glacier.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/glacier/glacier-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-tmobile-us \
    ro.com.google.clientidbase.vs=android-hms-tmobile-us \
    ro.com.google.clientidbase.ms=android-hms-tmobile-us \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.2_r6 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

DEVICE_PACKAGE_OVERLAYS += device/htc/glacier/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/glacier/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    lights.glacier \
    sensors.glacier \
    gps.glacier

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/glacier/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/glacier/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/glacier/keychars/glacier-keypad.kcm.bin:system/usr/keychars/glacier-keypad.kcm.bin \
    device/htc/glacier/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/glacier/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/glacier/keylayout/glacier-keypad.kl:system/usr/keylayout/glacier-keypad.kl \
    device/htc/glacier/keylayout/curcial-oj.kl:system/usr/keylayout/curcial-oj.kl \
    device/htc/glacier/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/glacier/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/glacier/firmware/fw_bcm4329_5GHz.bin:system/vendor/firmware/fw_bcm4329_5GHz.bin \
    device/htc/glacier/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/glacier/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/glacier/firmware/default_org_WA.acdb:system/etc/firmware/default_org_WA.acdb \
    device/htc/glacier/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/glacier/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/glacier/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/glacier/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/glacier/firmware/vidc_720p_mp2_dec_mc.fw:system/etc/firmware/vidc_720p_mp2_dec_mc.fw \
    device/htc/glacier/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/glacier/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/glacier/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/glacier/firmware/Glacier_SPK.acdb:system/etc/firmware/Glacier_SPK.acdb \
    device/htc/glacier/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/glacier/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

PRODUCT_COPY_FILES += \
    device/htc/glacier/vold.fstab:system/etc/vold.fstab

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/glacier/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/glacier/modules/bcm4329.ko:system/lib/modules/bcm4329.ko

$(call inherit-product-if-exists, vendor/htc/glacier/glacier-vendor.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/glacier/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/glacier/media_htcaudio.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)


PRODUCT_NAME := htc_glacier
PRODUCT_DEVICE := glacier
PRODUCT_MODEL := T-Mobile myTouch 4G
PRODUCT_MANUFACTURER := HTC

