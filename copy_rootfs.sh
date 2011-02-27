#!/bin/bash

if [ "x${1}" = "x" ]; then
	echo -e "\nUsage: ${0} <block device>\n"
	exit 0
fi

if [[ -z "${OETMP}" ]]; then
	echo "Working from local directory"
else
	echo "Using OETMP $OETMP"

	if [ -d ${OETMP}/deploy/glibc/images/overo ]; then
		cd ${OETMP}/deploy/glibc/images/overo
	else
		echo "Directory not found: ${OETMP}/deploy/glibc/images/overo"
		exit 1
	fi
fi 

DEV=/dev/${1}2

if [ -b $DEV ]; then
	echo "Formatting $DEV as ext3"
	sudo mkfs.ext3 -L ROOT $DEV

	echo "Mounting $DEV"
	sudo mount $DEV /media/card

	echo "Untar'ing rootfs to /media/card"
	sudo tar -C /media/card -xvjf work-image-overo.tar.bz2

	if [ -f fix-minimal-startup-scripts.sh ]; then
		echo "Fixing startup scripts"
		./fix-minimal-startup-scripts.sh
	fi

	echo "Umounting $DEV"
	sudo umount $DEV
else
	echo "Block special file $DEV does not exist"
fi

if [[ -z "${OETMP}" ]]; then
	echo "Done"
else
	cd $OLDPWD
	echo "Done"
fi
