include $(TOPDIR)/rules.mk

PKG_NAME:=ffda-domain-director
PKG_VERSION:=2
PKG_RELEASE:=1

include $(TOPDIR)/../package/gluon.mk

define Package/ffda-domain-director
  TITLE:=FFDA Domain-Director
  DEPENDS:=+gluon-core +libiwinfo +luaposix
endef

define Package/ffda-domain-director/description
	Direct nodes into their corresponding mesh-domain based on their location.
endef

$(eval $(call BuildPackageGluon,ffda-domain-director))
