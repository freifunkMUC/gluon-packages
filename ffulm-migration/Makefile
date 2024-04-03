include $(TOPDIR)/rules.mk

PKG_NAME:=ffulm-migration
PKG_VERSION:=1
PKG_LICENSE:=MIT

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/../package/gluon.mk

define Package/$(PKG_NAME)
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=ffulm migration
  DEPENDS:=+gluon-core
  MAINTAINER:=Freifunk München <muenchen@freifunk.net>
endef

define Package/$(PKG_NAME)/description
	Package that migrates ffulm non-Gluon configs to a Gluon config and then reboots
endef

init_links := \
	K89log \
	K98boot \
	K99umount \
	S00sysfixtime \
  	S00urngd \
	S10boot \
	S10gluon-core-reconfigure \
	S10system \
	S11sysctl \
	S12log \
	S20gluon-core-reconfigure \
	S95done

define Package/$(PKG_NAME)/install
	$(Gluon/Build/Install)

	for link in $(init_links); do \
		$(LN) "/etc/init.d/$$$${link:3}" "$(1)/lib/gluon/ffulm-migration/rc.d/$$$${link}"; \
	done
endef

$(eval $(call BuildPackageGluon,$(PKG_NAME)))
