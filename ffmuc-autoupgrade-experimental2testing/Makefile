include $(TOPDIR)/rules.mk

PKG_NAME:=ffmuc-autoupgrade-experimental2testing
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/../package/gluon.mk

define Package/ffmuc-autoupgrade-experimental2testing
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Migration script to switch autoupgrader on nodes from experimental to testing
  DEPENDS:=+gluon-core
  MAINTAINER:=Freifunk München <muenchen@freifunk.net>
endef

define Package/ffmuc-move-experimental2testing/description
	Migration script to switch autoupgrader on nodes from experimental to testing
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ffmuc-autoupgrade-experimental2testing/install
	$(CP) ./files/* $(1)/
endef

define Package/ffmuc-autoupgrade-experimental2testing/postinst
endef

$(eval $(call BuildPackage,ffmuc-autoupgrade-experimental2testing))
