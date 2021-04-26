######################################
#
# cth-mods
#
######################################

CTH_MODS_VERSION = 0.1
CTH_MODS_SITE_METHOD = local
CTH_MODS_SITE = $($(PKG)_PKGDIR)/
CTH_MODS_BUNDLES = cth-mods.lv2

# call make with the current arguments and path. "$(@D)" is the build directory.
CTH_MODS_HOST_MAKE   = $(HOST_MAKE_ENV)   $(HOST_CONFIGURE_OPTS)   $(MAKE) -C $(@D)/source
CTH_MODS_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/source

# build command
define CTH_MODS_BUILD_CMDS
	$(CTH_MODS_TARGET_MAKE)
endef

# install command
define CTH_MODS_INSTALL_TARGET_CMDS
	$(CTH_MODS_TARGET_MAKE) install DESTDIR=$(TARGET_DIR)
endef

$(eval $(generic-package))
