LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := default-permissions-MozillaNlpBackend
LOCAL_SRC_FILES := default-permissions-MozillaNlpBackend.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/default-permissions
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := MozillaNlpBackend
LOCAL_SRC_FILES := org.microg.nlp.backend.ichnaea.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVELEGED_MODULE := true
LOCAL_REQUIRED_MODULES := default-permissions-MozillaNlpBackend
include $(BUILD_PREBUILT)
