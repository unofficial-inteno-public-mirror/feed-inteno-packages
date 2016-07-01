#
# Copyright (C) 2016 Inteno
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=uci-diff
PKG_VERSION:=1.0

PKG_SOURCE_VERSION:=aed64062ac44010b6d7335a248c7cdeb922bea13
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@private.inteno.se:/uci-diff

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/uci-diff
	CATEGORY:=Utilities
	DEPENDS:=+libuci +libubox +ubus +libjson-c +libblobmsg-json
	TITLE:=uci-diff
endef

define Package/uci-diff/description
	uci-diff
endef

define Package/uci-diff/install
	$(CP) ./files/* $(1)/
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/uci-diff $(1)/bin/
endef

$(eval $(call BuildPackage,uci-diff))
