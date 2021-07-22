include $(TOPDIR)/rules.mk

PKG_NAME:=ffmuc-autoupgrade-wireguard2experimental
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/../package/gluon.mk

define Package/ffmuc-autoupgrade-wireguard2experimental
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Migration script to switch autoupgrader on nodes from wireguard to experimental
  DEPENDS:=+gluon-core
  MAINTAINER:=Freifunk München <muenchen@freifunk.net>
endef

define Package/ffmuc-move-wireguard2experimental/description
	Migration script to switch autoupgrader on nodes from wireguard to experimental
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ffmuc-autoupgrade-wireguard2experimental/install
	$(CP) ./files/* $(1)/
endef

define Package/ffmuc-autoupgrade-wireguard2experimental/postinst
endef

$(eval $(call BuildPackage,ffmuc-autoupgrade-wireguard2experimental))
