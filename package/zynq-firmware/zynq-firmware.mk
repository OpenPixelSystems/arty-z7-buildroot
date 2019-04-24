################################################################################
#
# Zynq Firmware package
#
################################################################################

ZYNQ_FIRMWARE_VERSION = 1.0
ZYNQ_FIRMWARE_SITE = $(call github,openpixelsystems,makefile-vivado-project,master)
#ZYNQ_FIRMWARE_SITE_METHOD = git

define ZYNQ_FIRMWARE_BUILD_CMDS
    REPO_DIR=$(BR2_ZYNQ_REPO_PATH) ORIGIN_DIR=$(BR2_ZYNQ_FIRMWARE_PATH) $(MAKE) CC="$(HOST_CC)" LD="$(HOST_LD)" -C $(@D)
    cp $(@D)/build/project.sdk/project.bit $(BINARIES_DIR)/fpga.bit 
    cp $(@D)/system-ops.dtb $(BINARIES_DIR)/devicetree.dtb 
endef

$(eval $(generic-package))
