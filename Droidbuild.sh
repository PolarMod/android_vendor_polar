include_if_exists "$BASEDIR/incremental_vars.sh"

#FIXME: Use build.sh incremental builds when they
#       will be available

droidbuild_module(){
  if ndef VENDOR_POLAR_LOADED
  then  
    require_command patch
    #info "Patching NetworkStack overlay"
    #exec rm -f $BASEDIR/vendor/lineage/overlay/common/packages/modules/NetworkStack/res/values/config.xml
    #exec cp $LOCAL_PATH/overlays/networkstack_config.xml $BASEDIR/vendor/lineage/overlay/common/packages/modules/NetworkStack/res/values/config.xml
    #success "Patched NetworkStack overlay"
    info "Adding PolarMod vendor to Lineage build system"
    exec patch $BASEDIR/vendor/lineage/config/common.mk $LOCAL_PATH/patches/common.mk.patch
    success "Patched Lineage vendor"
    #info "Patching Updater"
    #exec mkdir -p $BASEDIR/vendor/lineage/overlay/common/packages/apps/Updater/res/values
    #exec mkdir -p $BASEDIR/vendor/lineage/overlay/packages/apps/Updater/res/values
    #exec cp $LOCAL_PATH/overlays/updater_config.xml $BASEDIR/vendor/lineage/overlay/common/packages/apps/Updater/res/values/strings.xml
    #exec cp $LOCAL_PATH/overlays/updater_config.xml $BASEDIR/vendor/lineage/overlay/packages/apps/Updater/res/values/strings.xml 
    #success "Patched updater"
    info "Patching prebuilts"
    exec rm -rf $BASEDIR/prebuilts/prebuiltapks
    exec cp -r $LOCAL_PATH/prebuilts $BASEDIR/prebuilts/prebuiltapks
    success "Succesfully patched prebuilts"
    info "Adding overlay for frameworks"
    exec mkdir -p $BASEDIR/vendor/lineage/overlay/common/frameworks/base/core/res/res/values/
    exec cp $LOCAL_PATH/overlays/frameworks_config.xml $BASEDIR/vendor/lineage/overlay/common/frameworks/base/core/res/res/values/config.xml
    success "Added overlay for frameworks"
    export VENDOR_POLAR_LOADED=1
    echo "VENDOR_POLAR_LOADED=1" >> $BASEDIR/incremental_vars.sh
  else
    info "vendor_polar is already enabled, skipping droidbuild for it."
  fi
  # Override privacy settings for NLP backends
  TARGET_PRIVACY_OVERRIDE_PACKAGES+=(org.microg.nlp)
  TARGET_PRIVACY_OVERRIDE_PACKAGES+=(org.microg.nlp.backend.ichnaea)
  TARGET_PRIVACY_OVERRIDE_PACKAGES+=(org.fitchfamily.android.dejavu)
}
