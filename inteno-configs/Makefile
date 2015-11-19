#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=inteno-configs

PKG_VERSION:=1.0
PKG_SOURCE_URL:=git://git@iopsys.inteno.se:inteno-configs.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=00db0314e997307f7036faf0777dd3d6bb14aff9

PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

######################################

define Package/conf-common-inteno
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=conf-common-inteno
endef

define Package/conf-common-inteno/install
	$(INSTALL_DIR) $(1)/etc/config
	$(CP) $(PKG_BUILD_DIR)/conf-common-inteno/etc/config/* $(1)/etc/config/
endef


######################################

$(eval $(call BuildPackage,conf-common-inteno))

