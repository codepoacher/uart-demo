include $(TOPDIR)/rules.mk

PKG_NAME:=uart-demo
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define Package/uart-demo
  SECTION:=Maipu
  CATEGORY:=Maipu
  DEPENDS:=@!LINUX_2_4
  TITLE:=Tools to uart demo program
  DEFAULT:=n
endef

define Package/uart-demo/description
  uart demo program.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR); \
		CC=$(TARGET_CC) $(MAKE) \
	) 
endef

define Package/uart-demo/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/uart_test $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,uart-demo))

