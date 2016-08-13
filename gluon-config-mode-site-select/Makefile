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
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc_welcome.conf"))))' > $(1)/lib/gluon/site-select/ffmuc_welcome.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc_umland.conf"))))' > $(1)/lib/gluon/site-select/ffmuc_umland.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc01.conf"))))' > $(1)/lib/gluon/site-select/ffmuc01.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc02.conf"))))' > $(1)/lib/gluon/site-select/ffmuc02.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc03.conf"))))' > $(1)/lib/gluon/site-select/ffmuc03.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc04.conf"))))' > $(1)/lib/gluon/site-select/ffmuc04.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc05.conf"))))' > $(1)/lib/gluon/site-select/ffmuc05.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc06.conf"))))' > $(1)/lib/gluon/site-select/ffmuc06.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc07.conf"))))' > $(1)/lib/gluon/site-select/ffmuc07.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc08.conf"))))' > $(1)/lib/gluon/site-select/ffmuc08.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc09.conf"))))' > $(1)/lib/gluon/site-select/ffmuc09.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc10.conf"))))' > $(1)/lib/gluon/site-select/ffmuc10.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc11.conf"))))' > $(1)/lib/gluon/site-select/ffmuc11.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc12.conf"))))' > $(1)/lib/gluon/site-select/ffmuc12.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc13.conf"))))' > $(1)/lib/gluon/site-select/ffmuc13.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc14.conf"))))' > $(1)/lib/gluon/site-select/ffmuc14.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc15.conf"))))' > $(1)/lib/gluon/site-select/ffmuc15.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc16.conf"))))' > $(1)/lib/gluon/site-select/ffmuc16.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc17.conf"))))' > $(1)/lib/gluon/site-select/ffmuc17.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc19.conf"))))' > $(1)/lib/gluon/site-select/ffmuc19.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc20.conf"))))' > $(1)/lib/gluon/site-select/ffmuc20.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc21.conf"))))' > $(1)/lib/gluon/site-select/ffmuc21.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc22.conf"))))' > $(1)/lib/gluon/site-select/ffmuc22.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc23.conf"))))' > $(1)/lib/gluon/site-select/ffmuc23.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc24.conf"))))' > $(1)/lib/gluon/site-select/ffmuc24.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc25.conf"))))' > $(1)/lib/gluon/site-select/ffmuc25.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffmuc_land.conf"))))' > $(1)/lib/gluon/site-select/ffmuc_land.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffbay_sta.conf"))))' > $(1)/lib/gluon/site-select/ffbay_sta.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffbay_ffb.conf"))))' > $(1)/lib/gluon/site-select/ffbay_ffb.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffbay_dah.conf"))))' > $(1)/lib/gluon/site-select/ffbay_dah.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffbay_fs.conf"))))' > $(1)/lib/gluon/site-select/ffbay_fs.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffbay_ed.conf"))))' > $(1)/lib/gluon/site-select/ffbay_ed.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffbay_ebe.conf"))))' > $(1)/lib/gluon/site-select/ffbay_ebe.json
	lua -e 'print(require("cjson").encode(assert(loadfile("site_config.lua")("$(GLUON_SITEDIR)/extra/ffbay_tol.conf"))))' > $(1)/lib/gluon/site-select/ffbay_tol.json
	DIR=$(1) sh create-config.sh
	
	$(call GluonInstallI18N,gluon-config-mode-site-select,$(1))
endef

$(eval $(call BuildPackage,gluon-config-mode-site-select))
