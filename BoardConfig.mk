USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/glacier/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon

TARGET_BOOTLOADER_BOARD_NAME := glacier

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/vendor/firmware/fw_bcm4329_5GHz.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/vendor/firmware/fw_bcm4329_5GHz.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"

BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := true
BOARD_CAMERA_USE_GETBUFFERINFO := true
BOARD_OVERLAY_FORMAT_YCbCr_420_SP := true
BOARD_USE_NEW_LIBRIL_HTC := true

BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_BASE := 0x04000000
BOARD_KERNEL_PAGE_SIZE := 4096

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_USE_BROADCOM_FM_VOLUME_HACK := true

BOARD_VENDOR_QCOM_AMSS_VERSION := 1200

BOARD_EGL_CFG := device/htc/glacier/egl.cfg

BOARD_USES_QCOM_LIBS := true

BOARD_USE_QCOM_PMEM := true
BOARD_USE_FROYO_LIBCAMERA := true
BOARD_USE_REVERSE_FFC := true

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := glacier
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240
BOARD_USES_QCOM_GPS := true

# Use RGB565 surfaces until userspace drivers are upgraded
BOARD_NO_RGBX_8888 := true

# Use nasty hack to make Kineto work
BOARD_USE_KINETO_COMPATIBILITY := true

# fix this up by examining /proc/mtd on a running device
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 4194304
# limited so we enforce room to grow
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 435941376
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1232072704

BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
TARGET_PREBUILT_KERNEL := device/htc/glacier/kernel

BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_USES_RECOVERY_CHARGEMODE := true
