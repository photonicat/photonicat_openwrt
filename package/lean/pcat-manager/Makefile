include $(TOPDIR)/rules.mk

PKG_NAME:=pcat-manager
PKG_VERSION:=1.0.16
PKG_RELEASE:=16

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/photonicat/rockchip_rk3568_pcat_manager.git
PKG_SOURCE_DATE:=2023-11-13
PKG_SOURCE_VERSION:=0149b4780866648d53a2a8633ecf7bc23f1937e5

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
  DEPENDS:=+glib2 +libgpiod +libjson-c +libusb-1.0
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

	$(INSTALL_DIR) $(1)/etc
ifdef CONFIG_TARGET_rockchip_armv8_DEVICE_ariaboard_photonicat
	$(INSTALL_CONF) ./files/photonicat/pcat-manager.conf $(1)/etc
else
	$(INSTALL_CONF) ./files/photonicat2/pcat-manager.conf $(1)/etc
endif

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/pcat-manager.init $(1)/etc/init.d/pcat-manager
endef


$(eval $(call BuildPackage,pcat-manager))
