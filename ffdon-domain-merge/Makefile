include $(TOPDIR)/rules.mk

PKG_NAME:=ffdon-domain-merge
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/../package/gluon.mk

define Package/$(PKG_NAME)
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=FFdon Domain Merge
  DEPENDS:=+gluon-core @GLUON_MULTIDOMAIN
  MAINTAINER:=Freifunk München <muenchen@freifunk.net>
endef

define Package/$(PKG_NAME)/description
	Script for merging ffdon domains after a sysupgrade
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(CP) ./files/* $(1)/
endef

define Package/$(PKG_NAME)/postinst
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
