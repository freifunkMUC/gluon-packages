include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-web-ffmuc-domain-director
PKG_VERSION:=1
PKG_RELEASE:=1

include $(TOPDIR)/../package/gluon.mk

define Package/gluon-web-ffmuc-domain-director
  TITLE:=gluon-web module to enable and disable ffmuc-domain-director
  DEPENDS:=+gluon-web-admin +ffmuc-domain-director
endef

$(eval $(call BuildPackageGluon,gluon-web-ffmuc-domain-director))
