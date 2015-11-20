#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=inteno-configs

PKG_VERSION:=1.0
PKG_SOURCE_URL:=git@iopsys.inteno.se:inteno-configs.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=e6836dbc3dde40eba661b3c37d5f5d0cc6f2e5d0

PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

######################################

define NewConfig 
  define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/etc/config
	$(INSTALL_DIR) $$(1)/etc/uci-defaults
	$(CP) $(PKG_BUILD_DIR)/$(1)/etc/config/* $$(1)/etc/config/ | true
	$(CP) $(PKG_BUILD_DIR)/$(1)/etc/uci-defaults/* $$(1)/etc/uci-defaults | true
  endef

  define Package/$(1)
	SECTION:=configs
	CATEGORY:=Configurations
	TITLE:=$(1)
  endef

endef


define AddConfig
  $(eval $(call NewConfig,$(1)))
  $(eval $(call BuildPackage,$(1)))
endef

######################################

$(eval $(call AddConfig,conf-common-inteno))
$(eval $(call AddConfig,conf-caiman-inteno))


