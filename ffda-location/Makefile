include $(TOPDIR)/rules.mk

PKG_NAME:=ffda-location
PKG_VERSION:=1
PKG_RELEASE:=1

include $(TOPDIR)/../package/gluon.mk

define Package/ffda-location
  TITLE:=FFDA Location lib
  DEPENDS:=+libiwinfo
endef

define Package/ffda-location/description
	Provides tools for WiFi-location.
endef

$(eval $(call BuildPackageGluon,ffda-location))
