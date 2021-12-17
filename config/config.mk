# PolarMod added packages
PRODUCT_PACKAGES += \
    Email \
    FDroid \
    FDroidPrivilegedExtension \
    Nextcloud \
    UnifiedNlp \
    MozillaNlpBackend \
    NominatimNlpBackend \
    Recorder \
		GeometricWeather \
    Updater

ifeq ($(TARGET_USES_MICROG), 1)
PRODUCT_PACKAGES += \
		additional_repos \
    com.google.android.maps.xml \
    com.google.android.maps.jar \
    GmsCore \
    GsfProxy \
    microg-a5k.xml 
endif

