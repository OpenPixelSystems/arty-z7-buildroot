#!/bin/bash

DESTINATION=$1
PATH_PREFIX=output/images/

if [ -z $DESTINATION ] || [ ! -d $DESTINATION ]; then
	echo "Empty folder or folder not found"
	exit
fi

echo "Good to go!"

echo "Cleaning destination"
rm -rf $DESTINATION'/*'

echo "Copying files"
for f in $PATH_PREFIX'u-boot.img' $PATH_PREFIX'boot.bin' $PATH_PREFIX'uImage' $PATH_PREFIX'zynq-artyz7.dtb' $PATH_PREFIX'rootfs.cpio.uboot' output/build/linux-digilent-v4.4/arch/arm/boot/Image
do
        echo $f
        cp $f $DESTINATION
done

echo "Renaming files"
mv $DESTINATION'/zynq-artyz7.dtb' $DESTINATION'/devicetree.dtb'
#mv $DESTINATION'/rootfs.cpio.uboot' $DESTINATION'/uramdisk.image.gz'
cp ./multi-with-fpga.its $DESTINATION

echo "Syncing files"
sync
