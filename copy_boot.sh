#!/bin/sh

if [ "x${1}" = "x" ]; then
	echo -e "\nUsage: ${0} <block device>\n"
	exit 0
fi

DEV=/dev/${1}1

if [ -b $DEV ]; then
	echo "Formatting FAT partition on $DEV"
	sudo mkfs.vfat -F 32 ${DEV} -n BOOT

	echo "Mounting $DEV"
	sudo mount ${DEV} /media/card

	echo "Copying MLO"
	sudo cp MLO-overo /media/card/MLO

	echo "Copying u-boot"
	sudo cp u-boot-overo.bin /media/card/u-boot.bin

	echo "Copying uImage"
	sudo cp uImage-overo.bin /media/card/uImage

	echo "Unmounting ${DEV}"
	sudo umount ${DEV}

	echo "Done"
else
	echo -e "\nBlock special file $DEV does not exist!\n"
fi

