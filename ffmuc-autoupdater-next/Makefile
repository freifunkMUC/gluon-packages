include $(TOPDIR)/rules.mk

PKG_NAME:=ffmuc-autoupdater-next
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/../package/gluon.mk

define Package/ffmuc-autoupdater-next
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Update script to make sure next nodes use next autoupdate branch
  DEPENDS:=+gluon-core
  MAINTAINER:=Freifunk München <muenchen@freifunk.net>
endef

define Package/ffmuc-autoupdater-next/description
	Update script to make sure next nodes use next autoupdate branch
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ffmuc-autoupdater-next/install
	$(CP) ./files/* $(1)/
endef

define Package/ffmuc-autoupdater-next/postinst
endef

$(eval $(call BuildPackage,ffmuc-autoupdater-next))
