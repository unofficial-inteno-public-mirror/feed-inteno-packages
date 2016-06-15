#
# Copyright (C) 2016 Inteno
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=uci-diff
PKG_VERSION:=1

PKG_SOURCE_VERSION:=92988d82483e8b8ca09e6207e9aba85bda71cc18
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@private.inteno.se:uci-diff

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath-link=$(STAGING_DIR)/lib

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
	$(INSTALL_DIR) $(1)/sbin
endef

$(eval $(call BuildPackage,uci-diff))
