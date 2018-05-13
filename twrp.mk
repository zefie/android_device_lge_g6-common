TW_NO_EXFAT_FUSE := true
TW_THEME := portrait_hdpi_zefie
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/soc/6a00000.ssusb/6a00000.dwc3/gadget/lun%d/file"
TW_BRIGHTNESS_PATH := "/sys/devices/soc/900000.qcom\x2cmdss_mdp/900000.qcom\x2cmdss_mdp:qcom\x2cmdss_fb_primary/leds/lcd-$
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 149
TW_SCREEN_BLANK_ON_BOOT := true
TW_INCLUDE_NTFS_3G := true
TW_EXCLUDE_SUPERSU := true
TW_IGNORE_MISC_WIPE_DATA := true

# Encryption support
TW_INCLUDE_CRYPTO := true
#TARGET_HW_DISK_ENCRYPTION := true
#TARGET_KEYMASTER_WAIT_FOR_QSEE := true

TW_CRYPTO_USE_SYSTEM_VOLD := qseecomd

# Debug flags
TWRP_INCLUDE_LOGCAT := true

