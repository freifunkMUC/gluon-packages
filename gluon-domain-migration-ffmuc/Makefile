include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-domain-migration-ffmuc
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/../package/gluon.mk

define Package/gluon-domain-migration-ffmuc
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Migration script for gluon multidomain support
  DEPENDS:=+gluon-core @GLUON_MULTIDOMAIN
  MAINTAINER:=Freifunk München <muenchen@freifunk.net>
endef

define Package/gluon-domain-migration-ffmuc/description
	Migration script for gluon multidomain support
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/gluon-domain-migration-ffmuc/install
	$(CP) ./files/* $(1)/
endef

define Package/gluon-domain-migration-ffmuc/postinst
endef

$(eval $(call BuildPackage,gluon-domain-migration-ffmuc))
