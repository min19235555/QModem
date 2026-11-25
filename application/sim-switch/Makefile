include $(TOPDIR)/rules.mk

include ../../version.mk

PKG_NAME:=sim-switch
PKG_VERSION:=$(QMODEM_VERSION)
PKG_RELEASE:=1
PKG_LICENSE:=GPLv3
PKG_MAINTAINER:=OpenWrt Integration

include $(INCLUDE_DIR)/package.mk

define Package/sim-switch
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=SIM slot switch control for CPE1252S
  DEPENDS:=+ubus +uci
endef

define Package/sim-switch/description
  GPIO based tri-SIM slot switching for Siflower CPE1252S.
  Provides /usr/bin/simctl used by the LuCI web page.
endef

define Package/sim-switch/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/simctl $(1)/usr/bin/simctl
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/etc/config/sim_switch $(1)/etc/config/sim_switch
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/96-sim-switch $(1)/etc/uci-defaults/96-sim-switch
endef

$(eval $(call BuildPackage,sim-switch))
