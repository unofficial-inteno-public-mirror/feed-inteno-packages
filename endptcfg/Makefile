#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=endptcfg
PKG_VERSION:=0.2
PKG_RELEASE:=1
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@iopsys.inteno.se:endptcfg
PKG_SOURCE_VERSION:=1194b05278bd0945ca5c76436e56617b86871a65
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

LDFLAGS+= \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
		-Wl,-rpath-link=$(STAGING_DIR)/lib

BCMKERNEL_DIR:=$(BUILD_DIR)/bcmkernel/bcm963xx
export BCMKERNEL_DIR

TARGET_LDFLAGS += $(BCMKERNEL_DIR)/userspace/private/apps/vodsl/telephonyProfiles/telephonyProfiles.o \
			$(BCMKERNEL_DIR)/userspace/private/apps/vodsl/voip/util/log/vodslLog.o \
			$(BCMKERNEL_DIR)/userspace/private/apps/vodsl/endpoint/endpoint_user.o \
			$(BCMKERNEL_DIR)/userspace/private/apps/vodsl/bos/bos.o \
			-lpthread

ifeq ($(CONFIG_BRCM_SDK_VER_416040),y)
TARGET_CFLAGS += -DFAKE_SSP
endif

RSTRIP:=true
export BUILD_DIR


include $(INCLUDE_DIR)/package.mk

define Package/endptcfg
  CATEGORY:=Utilities
  TITLE:=Broadcom endpoint driver configuration application
  URL:=
  DEPENDS:=+libpthread bcmkernel
endef

define Package/endptcfg/description
	Broadcom endpoint driver configuration application
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) LINUX_DIR=$(LINUX_DIR) LDFLAGS="$(TARGET_LDFLAGS)" CFLAGS="$(TARGET_CFLAGS) \
			-I$(LINUX_DIR)/include \
			-I$(STAGING_DIR)/usr/include \
			-DRS_ENDIAN_TYPE=RS_BIG_ENDIAN \
			-DBOS_OS_LINUXUSER -DBOS_CFG_TIME \
			-I$(STAGING_DIR)/usr/include/bcm963xx/bcmdrivers/broadcom/include/bcm963xx \
			-I$(STAGING_DIR)/usr/include/bcm963xx/bcmdrivers/opensource/include/bcm963xx \
			-I$(STAGING_DIR)/usr/include/bcm963xx/xChange/dslx_common/voice_res_gw/endpt/inc \
			-I$(STAGING_DIR)/usr/include/bcm963xx/xChange/dslx_common/voice_res_gw/inc \
			-I$(STAGING_DIR)/usr/include/bcm963xx/xChange/dslx_common/voice_res_gw/codec \
			-I$(STAGING_DIR)/usr/include/bcm963xx/xChange/dslx_common/xchg_common/bos/publicInc \
			-I$(STAGING_DIR)/usr/include/bcm963xx/xChange/dslx_common/voice_res_gw/casCtl/inc \
			-I$(STAGING_DIR)/usr/include/bcm963xx/xChange/dslx_common/xchg_drivers/inc \
			-I$(STAGING_DIR)/usr/include/bcm963xx/userspace/private/apps/vodsl/voip/inc \
			-I$(STAGING_DIR)/usr/include/bcm963xx/xChange/dslx_common/xchg_common/bos/LinuxUser"
endef

define Package/endptcfg/install
	$(INSTALL_DIR) $(1)/usr/bin
	cp $(PKG_BUILD_DIR)/endptcfg $(1)/usr/bin/
endef

$(eval $(call BuildPackage,endptcfg))