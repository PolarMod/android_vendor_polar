LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := default-permissions-DejaVuNlpBackend.xml
LOCAL_SRC_FILES := default-permissions-DejaVuNlpBackend.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT_ETC)/default-permissions
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := DejaVuNlpBackend
LOCAL_SRC_FILES := DejaVuNlpBackend.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRODUCT_MODULE := true
LOCAL_REQUIRED_MODULES := default-permissions-DejaVuNlpBackend.xml
include $(BUILD_PREBUILT)
