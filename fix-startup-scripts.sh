#!/bin/bash

ETCDIR=/media/card/etc

cd ${ETCDIR}/rcS.d
sudo mv S39alsa-state K39alsa-state
sudo mv S43portmap K43portmap
sudo mv S45mountnfs.sh K45mountnfs.sh
sudo mv S97blueprobe K97blueprobe

cd ${ETCDIR}/rc5.d
sudo mv S02dbus-1 K02dbus-1 
sudo mv S20apmd K20apmd
sudo mv S21avahi-daemon K21avahi-daemon
sudo mv S23bluetooth K23bluetooth
sudo mv S50usb-gadget K50usb-gadget

cd ${ETCDIR}/rc6.d
sudo mv K19avahi-daemon k19avahi-daemon
sudo mv K19bluetooth k19bluetooth
sudo mv K20dbus-1 k20dbus-1
sudo mv K20apmd k20apmd
sudo mv K31alsa-state k31alsa-state
sudo mv K50usb-gadget k50usb-gadget
sudo mv S31umountnfs.sh K31umountnfs.sh
sudo mv S32portmap s32portmap
sudo mv S25save-rtc.sh K25save-rtc.sh 
