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
    Updater \
<<<<<<< HEAD
    OmniJaws 
=======
    OmniJaws
>>>>>>> 83e12fb126495f7d702cdda74753e7a472a273bb

# FaceUnlock and blur on non-go systems
ifneq ($(PRODUCT_TYPE), go)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
<<<<<<< HEAD
   ro.surface_flinger.supports_background_blur=1 
=======
   ro.surface_flinger.supports_background_blur=1 \
   ro.face_unlock_service.enabled=false 
>>>>>>> 83e12fb126495f7d702cdda74753e7a472a273bb
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
endif

ifeq ($(TARGET_SUPPORTS_GVISUAL), 1)
  # G-Visual Mod
  PRODUCT_PACKAGES += \
      GVM-SBH-L \
      GVM-SBH-M \
      GVM-SBH-XL \
      GVM-URM-M \
      GVM-URM-L \
      GVM-URM-R
  PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	  	ro.system.supports_gvisual=true
else
  PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
			ro.system.supports_gvisual=false
endif
