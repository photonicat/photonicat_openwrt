include $(TOPDIR)/rules.mk

PKG_NAME:=pcat-manager-web
PKG_VERSION:=2.2.1
PKG_RELEASE:=124

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/photonicat/pcat-manager-web
PKG_SOURCE_DATE:=2026-06-11
PKG_SOURCE_VERSION:=23371d9041ae511208fa39f865eb88d69688df38

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE

PKG_INSTALL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/pcat-manager-web
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+python3 +python3-flask +python3-flask-babel \
	+python3-flask-httpauth +python3-flask-login \
	+python3-flask-seasurf +python3-flask-session \
	+python3-flask-socketio +python3-pyserial \
	+python3-requests +python3-click +python3-jinja2 \
	+python3-werkzeug +python3-itsdangerous +python3-passlib \
	+python3-legacy-cgi +python3-blinker +python3-pam
  TITLE:=PCat Manager Web interface
  URL:=https://git.g77k.com
  PROVIDES:=pcat-manager-web
endef

define Package/pcat-manager-web/description
  PCat Manager Web is a web interface for easier OpenWRT system configuration.
endef

define Package/pcat-manager-web/install
	$(INSTALL_DIR) $(1)/usr/share/pcat-manager-web
	$(INSTALL_DIR) $(1)/usr/share/pcat-manager-web/pcat_util
	$(INSTALL_DIR) $(1)/usr/share/pcat-manager-web/templates
	$(INSTALL_DIR) $(1)/usr/share/pcat-manager-web/static
	$(INSTALL_DIR) $(1)/usr/share/pcat-manager-web/static/fonts
	$(INSTALL_DIR) $(1)/usr/share/pcat-manager-web/static/fonts/Orbitron
	$(INSTALL_DIR) $(1)/usr/share/pcat-manager-web/static/fonts/Orbitron/static
	$(INSTALL_DIR) $(1)/usr/share/pcat-manager-web/static/fonts/Titillium_Web
	$(INSTALL_DIR) $(1)/usr/share/pcat-manager-web/static/inapp

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/build/*.pyc \
		$(1)/usr/share/pcat-manager-web/
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/build/pcat_util/*.pyc \
		$(1)/usr/share/pcat-manager-web/pcat_util/
	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/build/pcat-manager-web-main.pyc \
		$(1)/usr/share/pcat-manager-web/pcat-manager-web-main.pyc
	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/build/opkg-install.pyc \
		$(1)/usr/share/pcat-manager-web/opkg-install.pyc
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/build/templates/*.* \
		$(1)/usr/share/pcat-manager-web/templates/
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/build/static/*.* \
		$(1)/usr/share/pcat-manager-web/static/
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/build/static/fonts/Orbitron/*.ttf \
		$(1)/usr/share/pcat-manager-web/static/fonts/Orbitron/
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/build/static/fonts/Orbitron/static/*.ttf \
		$(1)/usr/share/pcat-manager-web/static/fonts/Orbitron/static/
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/build/static/fonts/Titillium_Web/*.ttf \
		$(1)/usr/share/pcat-manager-web/static/fonts/Titillium_Web/
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/build/static/inapp/*.svg \
		$(1)/usr/share/pcat-manager-web/static/inapp/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/pcat-manager-web.init $(1)/etc/init.d/pcat-manager-web
endef

define Build/Configure
	$(call HostPython3/PipInstall,--requirement ./requirements-host.txt)
	$(call HostPython3/PipInstall,--requirement $(PKG_BUILD_DIR)/requirements-openwrt.txt)
endef

define Build/Compile
	cd $(PKG_BUILD_DIR); $(HOST_PYTHON3_BIN) ./misc/make.py
endef

define Build/Install

endef

$(eval $(call BuildPackage,pcat-manager-web))
