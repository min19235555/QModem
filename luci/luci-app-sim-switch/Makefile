include $(TOPDIR)/rules.mk

include ../../version.mk

PKG_NAME:=luci-app-sim-switch
LUCI_TITLE:=SIM Slot Switch (CPE1252S)
LUCI_DESCRIPTION:=Switch between the three SIM slots on CPE1252S via GPIO.
PKG_VERSION:=$(QMODEM_VERSION)
LUCI_PKGARCH:=all
PKG_LICENSE:=GPLv3
PKG_MAINTAINER:=OpenWrt Integration
LUCI_DEPENDS:=+sim-switch

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
