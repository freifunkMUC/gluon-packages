include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-web-ffda-domain-director
PKG_VERSION:=1
PKG_RELEASE:=1

include $(TOPDIR)/../package/gluon.mk

define Package/gluon-web-ffda-domain-director
  TITLE:=gluon-web module to enable and disable ffda-domain-director
  DEPENDS:=+gluon-web-admin +ffda-domain-director
endef

$(eval $(call BuildPackageGluon,gluon-web-ffda-domain-director))
