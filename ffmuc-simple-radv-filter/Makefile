include $(TOPDIR)/rules.mk

PKG_NAME:=ffmuc-simple-radv-filter
PKG_VERSION:=1
PKG_RELEASE:=1

include $(TOPDIR)/../package/gluon.mk

define Package/ffmuc-simple-radv-filter
  TITLE:=Filters RAs 
  DEPENDS:=+gluon-ebtables +libgluonutil +libbatadv
endef

$(eval $(call BuildPackageGluon,ffmuc-simple-radv-filter))
