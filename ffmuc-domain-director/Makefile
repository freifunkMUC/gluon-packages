include $(TOPDIR)/rules.mk

PKG_NAME:=ffmuc-domain-director
PKG_VERSION:=2
PKG_RELEASE:=1

include $(TOPDIR)/../package/gluon.mk

define Package/ffmuc-domain-director
  TITLE:=FFMUC Domain-Director
  DEPENDS:=+gluon-core +libiwinfo +luaposix
endef

define Package/ffmuc-domain-director/description
	Direct nodes into their corresponding mesh-domain based on their location.
endef

$(eval $(call BuildPackageGluon,ffmuc-domain-director))
