include $(TOPDIR)/rules.mk

PKG_NAME:=pcat-manager-v1
PKG_VERSION:=1.0.16
PKG_RELEASE:=17

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=ssh://git@git.g77k.com/supercatexpert/pcat-manager.git
PKG_SOURCE_DATE:=2024-04-23
PKG_SOURCE_VERSION:=d9053bc4a6effcbeb516d9774fd401cb89c46acb

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE

PKG_INSTALL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/meson.mk

define Package/pcat-manager-v1
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+glib2 +libgpiod +libjson-c +libusb-1.0
  TITLE:=PCat System Manager v1
  URL:=https://git.g77k.com
  PROVIDES:=pcat-manager-v1
endef

define Package/pcat-manager-v1/description
  PCat Manager is a system service for power management and modem controlling.
endef

define Package/pcat-manager-v1/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/pcat-manager \
		$(1)/usr/bin/pcat-manager

	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/pcat-manager.conf $(1)/etc

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/pcat-manager.init $(1)/etc/init.d/pcat-manager
endef


$(eval $(call BuildPackage,pcat-manager-v1))
