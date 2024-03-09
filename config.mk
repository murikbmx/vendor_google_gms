#
# Copyright (C) 2021 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Automated
$(call inherit-product, vendor/google/gms/gms-vendor.mk)

# Android Build system uncompresses DEX files (classes*.dex) in the privileged
# apps by default, which breaks APK v2/v3 signature. Because some privileged
# GMS apps are still shipped with compressed DEX, we need to disable
# uncompression feature to make them work correctly.
DONT_UNCOMPRESS_PRIV_APPS_DEXS := true

# Overlays
PRODUCT_PACKAGES += \
    GmsConfigOverlayASI \
    GmsConfigOverlayCommon \
    GmsConfigOverlayComms \
    GmsConfigOverlayGeotz \
    GmsConfigOverlayGSA \
    GmsConfigOverlayPersonalSafety \
    GmsConfigOverlayPhotos \
    GmsSettingsOverlayPersonalSafety \
    GmsSettingsOverlayTurbo \
    GmsSettingsProviderOverlay \
    GmsSystemUIOverlay \
    GmsSystemUIOverlayPersonalSafety \
    GmsTelecommOverlay \
    GmsTelephonyOverlay

# Properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.gmsversion=14_202401 \
    ro.opa.eligible_device=true \
    ro.setupwizard.rotation_locked=true \
    setupwizard.theme=glif_v4_light

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif
