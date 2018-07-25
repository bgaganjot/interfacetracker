include $(TOPDIR)/rules.mk

PKG_NAME:=interfacetracker
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/interfacetracker-$(PKG_VERSION)
#PKG_SOURCE_URL:=@SF/helloworld
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/bgaganjot/interfacetracker.git
PKG_SOURCE_DATE:=2018-06-07
PKG_SOURCE_VERSION:=3b316de9829a4b5302b00582f0c20f80caf2ee1b
PKG_MIRROR_HASH:=3fae87e6b2a26a0617dcefea0f94ea897b39440abafb289a3fc344322d712e8f
PKG_MAINTAINER:=bgaganjot@gmail.com
#PKG_BUILD_DEPENDS:=+libuci
#PKG_MD5SUM:=9b7dc52656f5cbec846a7aba3299f73bd

#PKG_CAT:=zcat
#PKG_SOURCE:=helloworld-utils-$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/interfacetracker
	SECTION:=base
	CATEGORY:=Network
	TITLE:=interfaceTracker
	DEPENDS:=+libuci
	URL:=https://github.com/bgaganjot/interfacetracker.git
endef

define Package/interfacetracker/description
	Returns a message when one is received
endef

define Build/Configure
	$(call Build/Configure/Default,--with-linux-headers=$(LINUX_DIR))
endef

define Package/interfacetracker/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/interfacetracker $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/interfacetracker.init $(1)/etc/init.d/interfacetracker
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_BIN) ./files/interfacetracker.config $(1)/etc/config/interfacetracker
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_BIN) ./files/interfacetracker.hotplugd $(1)/etc/hotplug.d/iface/30-interfacetracker
	$(INSTALL_DIR) $(1)/tmp
	$(INSTALL_BIN) ./files/interfacetracker.postInstallScript $(1)/tmp
endef

define Package/interfacetracker/postinst
	#!/bin/sh
	/tmp/interfacetracker.postInstallScript
	rm /tmp/interfacetracker.postInstallScript
endef

$(eval $(call BuildPackage,interfacetracker))
