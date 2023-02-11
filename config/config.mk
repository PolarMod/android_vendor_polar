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

PRODUCT_PACKAGES += polarmod.xml

# GmsCompat
ifeq ($(TARGET_SUPPORTS_GMSCOMPAT), 1)
  PRODUCT_PACKAGES += GmsCompat
  # Guard against unsetted stock fingerprint
  ifndef PRODUCT_STOCK_FINGERPRINT
    $(error You are trying to do GmsCompat build without PRODUCT_STOCK_FINGREPRINT)
  endif
  PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
     ro.system.gms_compat=true \
     ro.build.stock_fingerprint=$(PRODUCT_STOCK_FINGERPRINT)
else
  PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
     ro.system.gms_compat=false
endif

# Include RROs config
include vendor/polar/config/rro.mk

# Override LINEAGE_VERSION
LINEAGE_VERSION="PolarMod-1.2-r2"
LINEAGE_DISPLAY_VERSION=$(LINEAGE_VERSION)

-include vendor/polar/config/private/config.mk
