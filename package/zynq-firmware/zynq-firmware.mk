################################################################################
#
# hello
#
################################################################################

ZYNQ_FIRMWARE_VERSION = 1.0
ZYNQ_FIRMWARE_SITE = $(call github,openpixelsystems,makefile-vivado-project,master)
#ZYNQ_FIRMWARE_SITE_METHOD = git

define ZYNQ_FIRMWARE_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
endef

$(eval $(generic-package))
