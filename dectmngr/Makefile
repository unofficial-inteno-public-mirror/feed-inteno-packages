#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_RELEASE:=1
PKG_VERSION:=1.0.24
PKG_SOURCE_URL:=http://public.inteno.se:/dectmngr
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=6ba403663bc9cfdb8f89fb34de367f0796d68552
PKG_NAME:=dectmngr


LDFLAGS+= \
        -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
		-Wl,-rpath-link=$(STAGING_DIR)/lib

RSTRIP:=true
export BUILD_DIR

PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/dectmngr
  CATEGORY:=Utilities
  TITLE:=Broadcom endpoint test application
  URL:=
  DEPENDS:= +libevent2 +libjson +natalie-dect-h bcmkernel
endef

define Package/dectmngr/description
	Dect proxy, manager and tools
endef


define Package/dectmngr/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_DIR) $(1)/etc/hotplug.d/
	$(INSTALL_DIR) $(1)/etc/hotplug.d/dect
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/etc/dect/
	$(INSTALL_DIR) $(1)/etc/config/

	cp $(PKG_BUILD_DIR)/dectmngr $(1)/usr/bin/
	cp $(PKG_BUILD_DIR)/atohx $(1)/usr/bin/
	cp $(PKG_BUILD_DIR)/dectproxy $(1)/usr/bin/
	cp $(PKG_BUILD_DIR)/dectdbgd $(1)/usr/bin/
	cp $(PKG_BUILD_DIR)/dect $(1)/usr/bin/
	cp $(PKG_BUILD_DIR)/dectcalib $(1)/usr/bin/
	cp $(PKG_BUILD_DIR)/dect_testmode $(1)/usr/bin/
	cp files/etc/init.d/* $(1)/etc/init.d/
	cp files/etc/hotplug.d/dect/* $(1)/etc/hotplug.d/dect/
	cp files/etc/dect/* $(1)/etc/dect/
	cp files/etc/config/* $(1)/etc/config/
	cp files/sbin/dectreg $(1)/sbin/
endef

$(eval $(call BuildPackage,dectmngr))
