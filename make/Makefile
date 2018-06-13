include $(TOPDIR)/rules.mk

PKG_NAME:=myreplyservice
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/myreplyservice-$(PKG_VERSION)
#PKG_SOURCE_URL:=@SF/helloworld
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/bgaganjot/myReplyService.git
PKG_SOURCE_DATE:=2018-06-07
PKG_SOURCE_VERSION:=44d8b3827e9a43445c2d4c936f0eb7f5947ca2a5
PKG_MIRROR_HASH:=d719e3b2c003c21d2b0c4535d652399f9cb457140a6294234aaa7cad57f284e0
PKG_MAINTAINER:=bgaganjot@gmail.com
#PKG_BUILD_DEPENDS:=+libuci
#PKG_MD5SUM:=9b7dc52656f5cbec846a7aba3299f73bd

#PKG_CAT:=zcat
#PKG_SOURCE:=helloworld-utils-$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/myreplyservice
	SECTION:=base
	CATEGORY:=Network
	TITLE:=myReplyService
	DEPENDS:=+libuci
	URL:=https://github.com/bgaganjot/myReplyService.git
endef

define Package/myreplyservice/description
	Returns a message when one is received
endef

define Build/Configure
	$(call Build/Configure/Default,--with-linux-headers=$(LINUX_DIR))
endef

define Package/myreplyservice/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/myreplyservice $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/myreplyservice.init $(1)/etc/init.d/myreplyservice
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_BIN) ./files/myreplyservice.config $(1)/etc/config/myreplyservice
endef

$(eval $(call BuildPackage,myreplyservice))
