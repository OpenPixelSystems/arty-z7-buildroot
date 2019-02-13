################################################################################
#
# Zynq Firmware package
#
################################################################################

ZYNQ_FIRMWARE_VERSION = 1.0
ZYNQ_FIRMWARE_SITE = $(call github,openpixelsystems,makefile-vivado-project,master)
#ZYNQ_FIRMWARE_SITE_METHOD = git

define ZYNQ_FIRMWARE_BUILD_CMDS
    ORIGIN_DIR=$(BR2_ZYNQ_FIRMWARE_PATH) $(MAKE) CC="$(HOST_CC)" LD="$(HOST_LD)" -C $(@D)
endef

$(eval $(generic-package))
