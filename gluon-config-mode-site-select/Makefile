include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-config-mode-site-select
PKG_VERSION:=0.2
PKG_RELEASE:=1

PKG_BUILD_DEPENDS := lua-cjson/host

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

PKG_CONFIG_DEPENDS += $(GLUON_I18N_CONFIG)

define Package/gluon-config-mode-site-select
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=UI for changing the node-config
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
	$(call GluonBuildI18N,gluon-config-mode-site-select,i18n)
endef

define Package/gluon-config-mode-site-select/install
	mkdir -p $(1)/etc/config/
	mkdir -p $(1)/lib/gluon/site-select/
	$(CP) ./files/* $(1)/

	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc.conf"))))' > $(1)/lib/gluon/site-select/ffmuc.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc_umland.conf"))))' > $(1)/lib/gluon/site-select/ffmuc_umland.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc_welcome.conf"))))' > $(1)/lib/gluon/site-select/ffmuc_welcome.json
	DIR=$(1) sh create-config.sh
	
	$(call GluonInstallI18N,gluon-config-mode-site-select,$(1))
endef

$(eval $(call BuildPackage,gluon-config-mode-site-select))
