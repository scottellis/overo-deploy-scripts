#!/bin/bash

sudo rm -rf /exports/overo/*

sudo tar -C /exports/overo -xvjf /gum/tmp/deploy/glibc/images/overo/omap3-console-image-overo.tar.bz2
#sudo tar -C /exports/overo -xvjf /gum/tmp/deploy/glibc/images/overo/network-test-image-overo.tar.bz2
#sudo tar -C /exports/overo -xvjf /gum/tmp/deploy/glibc/images/overo/submersible-image-overo.tar.bz2

