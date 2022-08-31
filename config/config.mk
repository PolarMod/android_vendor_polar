# PolarMod added packages
PRODUCT_PACKAGES += \
    Email \
    FDroid \
    FDroidPrivilegedExtension \
    Nextcloud \
    UnifiedNlp \
    MozillaNlpBackend \
    DejaVuNlpBackend \
    NominatimNlpBackend \
    Recorder \
    GeometricWeather \
    Updater \
    OmniJaws \
    GameSpace

# Enable blur on non-go systems
ifneq ($(PRODUCT_TYPE), go)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   ro.surface_flinger.supports_background_blur=1 
endif

# Disable runtime recovery updates
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   persist.vendor.recovery_update=false

# MicroG
ifeq ($(TARGET_USES_MICROG), 1)
PRODUCT_PACKAGES += \
    additional_repos \
    com.google.android.maps.xml \
    com.google.android.maps.jar \
    GmsCore \
    GsfProxy \
    Store \
    microg-a5k.xml 
else 
PRODUCT_PACKAGES += polarmod.xml
endif

# GmsCompat
ifeq ($(TARGET_SUPPORTS_GMSCOMPAT), 1)
PRODUCT_PACKAGES += GmsCompat
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   ro.system.gms_compat=true 
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   ro.system.gms_compat=false
endif

# Include RROs config
include vendor/polar/config/rro.mk

# Override LINEAGE_VERSION
LINEAGE_VERSION="PolarMod-1.2-beta3"
LINEAGE_DISPLAY_VERSION=$(LINEAGE_VERSION)
