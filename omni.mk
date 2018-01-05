$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product-if-exists, device/common/gps/gps_us_supl.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/board/generic_arm64/device.mk)

PRODUCT_BRAND := lge
PRODUCT_MANUFACTURER := LGE

PRODUCT_PACKAGES += \
	adbd

# Time Zone data for Recovery
PRODUCT_COPY_FILES += \
	device/lge/g6-common/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
