include $(TOPDIR)/rules.mk

PKG_NAME:=tecff-respondd-watchdog
PKG_VERSION:=1
PKG_RELEASE:=2

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/tecff-respondd-watchdog
  SECTION:=tecff
  CATEGORY:=Customization
  TITLE:=respondd watchdog
  DEPENDS:=+gluon-core +micrond
endef

define Build/Prepare
        mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/tecff-respondd-watchdog/install
        $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,tecff-respondd-watchdog))
