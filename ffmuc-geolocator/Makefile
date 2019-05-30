include $(TOPDIR)/rules.mk

PKG_NAME:=ffmuc-geolocator
PKG_VERSION:=1
PKG_RELEASE:=1

include $(TOPDIR)/../package/gluon.mk

define Package/ffmuc-geolocator
  TITLE:=FFMUC Geolocator
  DEPENDS:=+ffda-location
endef

define Package/ffmuc-geolocator/description
	Provides WiFi based positioning (copied from FFDA but adjusted to use FFMUC config)
endef

$(eval $(call BuildPackageGluon,ffmuc-geolocator))
