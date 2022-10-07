include $(TOPDIR)/rules.mk

PKG_NAME:=ffmuc-autoupdater-next2stable
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/../package/gluon.mk

define Package/ffmuc-autodater-next2stable
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Migration script to switch autoupdater on nodes from next to stable
  DEPENDS:=+gluon-core
  MAINTAINER:=Freifunk München <muenchen@freifunk.net>
endef

define Package/ffmuc-autoupdater-next2stable/description
	Migration script to switch autoupdater on nodes from next to stable
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ffmuc-autoupdater-next2stable/install
	$(CP) ./files/* $(1)/
endef

define Package/ffmuc-autoupdater-next2stable/postinst
endef

$(eval $(call BuildPackage,ffmuc-autoupdater-next2stable))
