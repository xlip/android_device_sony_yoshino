ifeq ($(BOARD_MODEM_CUSTOMIZATIONS),true)

include $(CLEAR_VARS)
CUSTOMIZATION_MODEM_SYMLINKS := $(TARGET_OUT)/etc/customization/modem
$(CUSTOMIZATION_MODEM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Create customization modem links: $@"
	@mkdir -p $@
	$(hide) ln -sf amss_fsg_lilac_tar.mbn $@/default
	$(hide) ln -sf amss_fs_empty.mbn $@/reset_modemst1
	$(hide) ln -sf amss_fs_empty.mbn $@/reset_modemst2

ALL_DEFAULT_INSTALLED_MODULES += \
	$(CUSTOMIZATION_MODEM_SYMLINKS)

include $(CLEAR_VARS)
LOCAL_MODULE := init.sony.modem.sh
LOCAL_SRC_FILES := init.sony.modem.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_STEM := init.sony.modem.sh
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_EXECUTABLES)
include $(BUILD_PREBUILT)

endif