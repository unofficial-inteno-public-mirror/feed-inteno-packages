#
# Copyright (C) 2016 Inteno
#

include $(TOPDIR)/rules.mk

PKG_NAME:=inteno-netmodes
PKG_RELEASE:=1
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/inteno-netmodes
	CATEGORY:=Base system
	TITLE:=Predefined Network Modes
endef

define Package/inteno-netmodes/description
	Predefined Network Modes
endef

define Build/Compile
endef

define Package/inteno-netmodes/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,inteno-netmodes))

########### Netmodes ###########

define DefineNetmode
define Package/inteno-netmodes-$(1)
	CATEGORY:=Base system
	TITLE:=$(2)
	DESCRIPTION:=$(3)
	DEPENDS:=inteno-netmodes $(4)
endef

define Package/inteno-netmodes-$(1)/install
	$(eval $(call ExtraInstall))
	$(INSTALL_DIR) $$(1)/etc/netmodes/$(1)
	$(CP) ./netmodes/$(1)/* $$(1)/etc/netmodes/$(1)
endef
endef

define RegisterNetmode
	$(eval $(call DefineNetmode,$(1),$(2)))
	$(eval $(call BuildPackage,inteno-netmodes-$(1)))
endef

$(eval $(call RegisterNetmode,routed, Routed Netmode, Fully Routed (NAT),,))
$(eval $(call RegisterNetmode,bridged, Bridged Netmode, Bridged IPTV,,))
$(eval $(call RegisterNetmode,internet_iptv_voip, IPTV VOIP Netmode, VoIP + Bridged IPTV,,))
$(eval $(call RegisterNetmode,repeater, Repeater Netmode, Repeater 2.4▴▾5,,))
$(eval $(call RegisterNetmode,repeater_dualdown, Repeater Netmode dual, Repeater 2.4▴▾2.4&5,,))
