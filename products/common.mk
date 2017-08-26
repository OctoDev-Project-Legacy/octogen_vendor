# Generic product
PRODUCT_NAME := octogen
PRODUCT_BRAND := octogen
PRODUCT_DEVICE := generic

PRODUCT_BUILD_PROP_OVERRIDES := BUILD_DISPLAY_ID=$(TARGET_PRODUCT)-$(PLATFORM_VERSION)-$(BUILD_ID)

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.com.android.dataroaming=false \
    drm.service.enabled=true \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1 \
    ro.adb.secure=0

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/octogen/overlay/common

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Latin IME lib - gesture typing
PRODUCT_COPY_FILES += \
    vendor/octogen/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Extra packages
PRODUCT_PACKAGES += \
    Busybox \
    LockClock \
    Stk \
    Terminal

# Init.d script support
PRODUCT_COPY_FILES += \
    vendor/octogen/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/octogen/prebuilt/common/etc/init.d.rc:root/init.d.rc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/octogen/prebuilt/common/addon.d/50-octogen.sh:system/addon.d/50-octogen.sh \
    vendor/octogen/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/octogen/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions

# Boot animations
$(call inherit-product-if-exists, vendor/octogen/products/bootanimation.mk) 
