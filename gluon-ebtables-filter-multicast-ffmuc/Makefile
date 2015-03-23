include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-ebtables-filter-multicast-ffmuc
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/gluon-ebtables-filter-multicast-ffmuc
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Ebtables filters for multicast traffic custom to ffmuc community
  DEPENDS:=+gluon-core +gluon-ebtables
endef

define Package/gluon-ebtables-filter-multicast-ffmuc/description
	Gluon community wifi mesh firmware framework: Ebtables filters for multicast traffic custom to ffmuc community
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/gluon-ebtables-filter-multicast-ffmuc/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,gluon-ebtables-filter-multicast-ffmuc))
