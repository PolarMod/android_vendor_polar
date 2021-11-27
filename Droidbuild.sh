droidbuild(){
  if ndef VENDOR_POLAR_LOADED
  then  
    require_command patch
    info "Patching NetworkStack overlay"
    exec rm -f $BASEDIR/vendor/lineage/overlay/common/packages/modules/NetworkStack/res/values/config.xml
    exec cp $LOCAL_PATH/overlays/networkstack_config.xml $BASEDIR/vendor/lineage/overlay/common/packages/modules/NetworkStack/res/values/config.xml
    success "Patched NetworkStack overlay"
    info "Adding PolarMod vendor to Lineage build system"
    exec patch $BASEDIR/vendor/lineage/config/common.mk $LOCAL_PATH/patches/common.mk.patch
    success "Patched Lineage vendor"
    info "Patching Updater"
    exec mkdir -p $BASEDIR/vendor/lineage/overlay/common/packages/apps/Updater/res/values
    exec mkdir -p $BASEDIR/vendor/lineage/overlay/packages/apps/Updater/res/values
    exec cp $LOCAL_PATH/overlays/updater_config.xml $BASEDIR/vendor/lineage/overlay/common/packages/apps/Updater/res/values/strings.xml
    exec cp $LOCAL_PATH/overlays/updater_config.xml $BASEDIR/vendor/lineage/overlay/packages/apps/Updater/res/values/strings.xml 
    success "Patched updater"
    export VENDOR_POLAR_LOADED=1
  else
    info "vendor_polar is already enabled, skipping droidbuild for it."
  fi
}
