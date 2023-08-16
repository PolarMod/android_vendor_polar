# Icon Packs
PRODUCT_PACKAGES += \
    IconPackPUIAndroidOverlay \
    IconPackPUILauncherOverlay \
    IconPackPUISettingsOverlay \
    IconPackPUISystemUIOverlay \
    IconPackPUIThemePickerOverlay \
    IconPackOOSAndroidOverlay \
    IconPackOOSLauncherOverlay \
    IconPackOOSSettingsOverlay \
    IconPackOOSSystemUIOverlay \
    IconPackOOSThemePickerOverlay \
    IconPackAcherusAndroidOverlay \
    IconPackAcherusSystemUIOverlay

#FOD resources
ifeq ($(TARGET_HAS_FOD), true)
PRODUCT_PACKAGES += \
        UdfpsAnimations \
	UdfpsIcons
endif
