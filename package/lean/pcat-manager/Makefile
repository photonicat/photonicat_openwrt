include $(TOPDIR)/rules.mk

PKG_NAME:=pcat-manager
PKG_VERSION:=2.0.0
PKG_RELEASE:=18

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/photonicat/rockchip_rk3568_pcat_manager
PKG_SOURCE_DATE:=2025-08-22
PKG_SOURCE_VERSION:=35206061e1099e6bf91e7f037f435c243264a1c2

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE

PKG_INSTALL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/meson.mk

define Package/pcat-manager
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+glib2 +libjson-c +libusb-1.0
  TITLE:=PCat System Manager
  URL:=https://git.g77k.com
  PROVIDES:=pcat-manager
endef

define Package/pcat-manager/description
  PCat Manager is a system service for power management and modem controlling.
endef

define Package/pcat-manager/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/pcat-manager \
		$(1)/usr/bin/pcat-manager

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/pcat-pmu-updater \
		$(1)/usr/bin/pcat-pmu-updater

	$(INSTALL_DIR) $(1)/etc

	$(INSTALL_CONF) ./files/pcat-manager.conf $(1)/etc

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/pcat-manager.init $(1)/etc/init.d/pcat-manager
endef


$(eval $(call BuildPackage,pcat-manager))
