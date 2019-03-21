include $(TOPDIR)/rules.mk

PKG_NAME:=tecff-ath9k-broken-wifi-workaround
PKG_VERSION:=2
PKG_RELEASE:=4

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/tecff-ath9k-broken-wifi-workaround
  SECTION:=tecff
  CATEGORY:=Customization
  TITLE:=ath9k broken wifi workaround
  DEPENDS:=+gluon-core +micrond
endef

define Build/Prepare
        mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/tecff-ath9k-broken-wifi-workaround/install
        $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,tecff-ath9k-broken-wifi-workaround))
