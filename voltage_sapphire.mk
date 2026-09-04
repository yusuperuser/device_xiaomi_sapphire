#
# Copyright (C) 2024 VoltageOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from sapphire device
$(call inherit-product, device/xiaomi/sapphire/device.mk)

# Inherit some common VoltageOS stuff.
$(call inherit-product, vendor/voltage/config/common_full_phone.mk)

# Include our private certificate
-include vendor/voltage-priv/keys/keys.mk

# GApps: TODO - confirm VoltageOS's gapps inclusion path before enabling.
# WitAqua used `-include vendor/gapps/arm64/arm64-vendor.mk` (Lineage convention) -
# VoltageOS may differ. Leave out until confirmed, otherwise WITH_GMS below
# will reference packages that don't exist and break the build.

# AudioFX
TARGET_EXCLUDES_AUDIOFX := true

# Device configs
TARGET_BOOT_ANIMATION_RES = 1080
TARGET_HAS_UDFPS := true

PRODUCT_NAME := voltage_sapphire
PRODUCT_DEVICE := sapphire
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 13

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="sapphire_global-user 15 AQ3A.240829.003 OS2.0.211.0.VNGMIXM release-keys" \
    BuildFingerprint=Redmi/sapphire_global/sapphire:15/AQ3A.240829.003/OS2.0.211.0.VNGMIXM:user/release-keys
