include $(TOPDIR)/rules.mk

PKG_NAME:=ffmuc-persist-mesh-disabled-ibss211s
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/../package/gluon.mk

define Package/ffmuc-persist-mesh-disabled-ibss211s
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Migration script to keep meshing via _11s disabled if ibss was disabled before
  DEPENDS:=+gluon-core
  MAINTAINER:=Freifunk München <muenchen@freifunk.net>
endef

define Package/ffmuc-move-experimental2testing/description
	Migration script to keep meshing via 11s disabled if ibss was disabled before
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ffmuc-persist-mesh-disabled-ibss211s/install
	$(CP) ./files/* $(1)/
endef

define Package/ffmuc-persist-mesh-disabled-ibss211s/postinst
endef

$(eval $(call BuildPackage,ffmuc-persist-mesh-disabled-ibss211s))
