#
# Copyright (C) 2023 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# APEX
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# API
PRODUCT_SHIPPING_API_LEVEL := 29

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Audio
PRODUCT_ODM_PROPERTIES += \
    ro.vendor.audio.sdk.fluencetype=fluence \
    vendor.audio.adm.buffering.ms=6 \
    vendor.audio.hal.output.suspend.supported=false \
    vendor.audio.offload.track.enable=false

PRODUCT_VENDOR_PROPERTIES += \
    audio.offload.buffer.size.kb=32 \
    audio.offload.gapless.enabled=true \
    persist.audio.button_jack.profile=volume \
    persist.audio.button_jack.switch=0 \
    persist.vendor.audio.ambisonic.capture=false \
    persist.vendor.audio.hifi=false \
    persist.vendor.audio.ring.filter.mask=0 \
    ro.audio.monitorRotation=true \
    ro.config.vc_call_vol_steps=11 \
    ro.vendor.audio.scenario.support=true \
    ro.vendor.audio.soundfx.type=mi \
    ro.vendor.audio.soundfx.usb=true \
    ro.vendor.audio.us.proximity=true \
    vendor.audio.mic.status=off \
    vendor.audio.spkcal.copy.inhal=true

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Bluetooth
PRODUCT_VENDOR_PROPERTIES += \
    persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxhd-ldac \
    persist.sys.fflag.override.settings_bluetooth_hearing_aid=true \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptiver2 \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.soc=cherokee \
    ro.bluetooth.a2dp_offload.supported=true \
    vendor.bluetooth.soc=cherokee \
    vendor.hw.fm.init=0 \
    vendor.qcom.bluetooth.soc=cherokee

# Camera
PRODUCT_VENDOR_PROPERTIES += \
    camera.disable_zsl_mode=true \
    persist.camera.gyro.disable=0 \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    libdng_sdk.vendor \
    libgui_vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# Config Store
PRODUCT_PACKAGES += \
    disable_configstore

# Crypto
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.hardware.keystore_desede=true

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Display
PRODUCT_VENDOR_PROPERTIES += \
    persist.sys.sf.native_mode=2 \
    ro.surface_flinger.set_idle_timer_ms=280 \
    ro.surface_flinger.set_touch_timer_ms=320 \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true \
    ro.vendor.display.sensortype=2 \
    vendor.display.qdcm.disable_factory_mode=1 \
    vendor.display.qdcm.mode_combine=1

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.sf.use_latest_hwc_vsync_period=0

# Doze
PRODUCT_PACKAGES += \
    ParanoidDoze

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.sensor.pickup=xiaomi.sensor.pickup

# DPM
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.dpm.feature=11 \
    persist.vendor.dpmhalservice.enable=1

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm@1.4-service.clearkey

# FRP
PRODUCT_VENDOR_PROPERTIES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.xiaomi_gauguin

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# GPS
LOC_HIDL_VERSION := 4.0

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/gps/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.mi.btmac.sh \
    init.mi.usb.sh \
    init.qti.dcvs.sh \
    init.target.rc \
    init.gauguin.rc \
    ueventd.gauguin.rc

# IMS
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1

# IR
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi

# Media
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    mm.enable.smoothstreaming=true \
    ro.media.recorder-max-base-layer-fps=60

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi

# Netd
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor

# Netflix
PRODUCT_VENDOR_PROPERTIES += \
    ro.netflix.bsp_rev=Q7250-19133-1

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2.vendor

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/nfc/,$(TARGET_COPY_OUT_VENDOR)/etc)

# ODM
PRODUCT_ODM_PROPERTIES += \
    ro.vendor.qti.va_odm.support=1

# Overlay
PRODUCT_PACKAGES += \
    AOSPAGauguinFrameworks \
    AOSPAGauguinSettings \
    GauguinCarrierConfig \
    GauguinFrameworks \
    GauguinSystemUI \
    GauguinTelephony \
    GauguinWifi

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Platform
TARGET_BOARD_PLATFORM := lito

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libraries/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# QTI
TARGET_COMMON_QTI_COMPONENTS := \
    adreno \
    audio \
    av \
    bt \
    charging \
    display \
    gps \
    init \
    keymaster \
    media \
    nfc \
    overlay \
    perf \
    vibrator \
    qseecomd \
    telephony \
    usb \
    wfd \
    wlan

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.5.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.deprecated@1.0.vendor

PRODUCT_VENDOR_PROPERTIES += \
    persist.radio.NO_STAPA=1 \
    persist.radio.VT_HYBRID_ENABLE=1 \
    persist.rcs.supported=0 \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.cdma_cap=true \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.data_ltd_sys_ind=1 \
    persist.vendor.radio.dynamic_sar=1 \
    persist.vendor.radio.enable_temp_dds=true \
    persist.vendor.radio.force_ltd_sys_ind=1 \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.manual_nw_rej_ct=1 \
    persist.vendor.radio.report_codec=1 \
    ril.subscription.types=NV,RUIM \
    rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so \
    ro.telephony.default_cdma_sub=0 \
    ro.telephony.default_network=33,33 \
    ro.vendor.radio.5g=3 \
    ro.vendor.radio.features_common=3 \
    ro.vendor.se.type=eSE,HCE,UICC \
    sys.vendor.shutdown.waittime=500

# Sensor
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

# Shims
PRODUCT_PACKAGES += \
    libpiex_shim

# SKU
PRODUCT_PACKAGES += \
    SettingsOverlayM2007J17C \
    SettingsOverlayM2007J17G \
    SettingsOverlayM2007J17I

# SoC
PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.model=SM7225

# SSR
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.ssr.restart_level=ALL_ENABLE

# Telephony
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml

# Thermal
PRODUCT_VENDOR_PROPERTIES += \
    vendor.sys.thermal.data.path=/data/vendor/thermal/

# Time Service
PRODUCT_VENDOR_PROPERTIES += \
    persist.timed.enable=true

# VA
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.vendor.qti.va_aosp.support=1

# Vendor Service Manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Vendor
$(call inherit-product, vendor/xiaomi/gauguin/gauguin-vendor.mk)

# Vibrator
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# WFD
PRODUCT_VENDOR_PROPERTIES += \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0

PRODUCT_PACKAGES += \
    libwfdaac_vendor:32

# WLAN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wlan/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini
