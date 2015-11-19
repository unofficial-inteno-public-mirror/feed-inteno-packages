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
PKG_SOURCE_VERSION:=93600eca73be60797e1b010ff1f967a051b06169

PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define NewConfig
  define Package/$(1)/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(CP) $(PKG_BUILD_DIR)/conf-caiman-inteno/etc/config/* $(1)/etc/config/
	$(CP) $(PKG_BUILD_DIR)/conf-caiman-inteno/etc/uci-defaults/* $(1)/etc/uci-defaults
  endif
endef

######################################

define Package/conf-common-inteno
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=conf-common-inteno
endef

define Package/conf-caiman-inteno
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=conf-caiman-inteno
endef


######################################

$(eval $(call NewConfig,conf-common-inteno))
$(eval $(call NewConfig,conf-caiman-inteno))

######################################

$(eval $(call BuildPackage,conf-common-inteno))
$(eval $(call BuildPackage,conf-caiman-inteno))

