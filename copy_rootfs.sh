#!/bin/sh

if [ "x${1}" = "x" ]; then
	echo -e "\nUsage: ${0} <block device>\n"
	exit 0
fi

DEV=/dev/${1}2

if [ -b $DEV ]; then
	echo "Formatting $DEV as ext3"
	sudo mkfs.ext3 $DEV

	echo "Mounting $DEV"
	sudo mount $DEV /media/card

	echo "Untar'ing rootfs to /dev/sdc2"
	sudo tar -C /media/card -xvjf omap3-console-image-overo.tar.bz2
	#sudo tar -C /media/card -xvjf network-test-image-overo.tar.bz2

	echo "Sleeping for 60 seconds"
	sleep 60

	# echo "Fixing startup scripts"
	# ./fix-startup-scripts.sh

	echo "Umounting $DEV"
	sudo umount $DEV

	echo "Done"
else
	echo "Block special file $DEV does not exist"
fi
