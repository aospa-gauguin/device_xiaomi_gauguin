#
# Copyright (C) 2023 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Keymaster
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.filenames_mode = "aes-256-cts"

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Platform
TARGET_BOARD_PLATFORM := lito

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
