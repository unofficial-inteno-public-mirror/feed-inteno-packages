#
# Copyright (C) 2014 Inteno
#

include $(TOPDIR)/rules.mk

PKG_NAME:=voice-client
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/voice-client
  SUBMENU:=Telephony
  SECTION:=net
  CATEGORY:=Network
  TITLE:=voice-client
endef

define Package/voice-client/description
	voice-client
endef

define Package/voice-client/conffiles
/etc/asterisk_templates/asterisk.conf.TEMPLATE
/etc/asterisk_templates/brcm.conf.TEMPLATE
/etc/asterisk_templates/brcm_line.TEMPLATE
/etc/asterisk_templates/cdr.conf.TEMPLATE
/etc/asterisk_templates/codecs.conf.TEMPLATE
/etc/asterisk_templates/dnsmgr.conf.TEMPLATE
/etc/asterisk_templates/extensions.conf.TEMPLATE
/etc/asterisk_templates/extensions_dialtone.TEMPLATE
/etc/asterisk_templates/extensions_direct.TEMPLATE
/etc/asterisk_templates/extensions_extra.conf.TEMPLATE
/etc/asterisk_templates/extensions_incoming_line.TEMPLATE
/etc/asterisk_templates/extensions_incoming.TEMPLATE
/etc/asterisk_templates/extensions_local_line.TEMPLATE
/etc/asterisk_templates/extensions_local.TEMPLATE
/etc/asterisk_templates/extensions_macro.conf.TEMPLATE
/etc/asterisk_templates/extensions_provider.TEMPLATE
/etc/asterisk_templates/features.conf.TEMPLATE
/etc/asterisk_templates/indications.conf.TEMPLATE
/etc/asterisk_templates/logger.conf.TEMPLATE
/etc/asterisk_templates/manager.conf.TEMPLATE
/etc/asterisk_templates/meetme.conf.TEMPLATE
/etc/asterisk_templates/modules.conf.TEMPLATE
/etc/asterisk_templates/musiconhold.conf.TEMPLATE
/etc/asterisk_templates/queues.conf.TEMPLATE
/etc/asterisk_templates/queue.TEMPLATE
/etc/asterisk_templates/res_stun_monitor.conf.TEMPLATE
/etc/asterisk_templates/rtp.conf.TEMPLATE
/etc/asterisk_templates/sip.conf.TEMPLATE
/etc/asterisk_templates/sip_provider.TEMPLATE
/etc/asterisk_templates/sip_provider_voicesec.TEMPLATE
/etc/asterisk_templates/sip_registration.TEMPLATE
/etc/asterisk_templates/sip_registration_voicesec.TEMPLATE
/etc/asterisk_templates/sip_user.TEMPLATE
/etc/asterisk_templates/voicemail.conf.TEMPLATE
/etc/asterisk_templates/voicemail_mailbox.TEMPLATE
/etc/init.d/voice_client
/etc/config/voice_client
/etc/config/voice_codecs
/etc/uci-defaults/99-voice_client
/etc/idc_cc.cfg
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./files/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
endef

define Package/voice-client/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,voice-client))
