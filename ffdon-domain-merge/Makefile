include $(TOPDIR)/rules.mk

PKG_NAME:=ffdon-domain-merge
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/../package/gluon.mk

define Package/ffdon-domain-merge
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=FFdon Domain Merge
  DEPENDS:=+gluon-core @GLUON_MULTIDOMAIN
  MAINTAINER:=Freifunk München <muenchen@freifunk.net>
endef

define Package/ffdon-domain-merge/description
	Script for merging ffdon domains after a sysupgrade
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ffdon-domain-merge/install
	$(CP) ./files/* $(1)/
endef

define Package/ffdon-domain-merge/postinst
endef

$(eval $(call BuildPackage,ffdon-domain-merge))
