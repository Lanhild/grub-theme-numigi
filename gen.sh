#!/bin/bash
# Script used to generate packages using the fpm utility
# The stdin $1 argument is the version number, passed as './gen.sh n.x', n.x being the version number.

#Variables assignation
#Automatically export all variables
set -a
source .env
set +a

TYPE="deb"
NAME="grub-theme-numigi"
URL="https://github.com/Lanhild/grub-theme-numigi"

fpm -s dir -t deb -p $NAME-$1-any.deb \
	--name $NAME \
	--license $LICENSE \
	--version $1 \
	--architecture all \
	--depends grub2-common \
	--description "Numigi GRUB bootloader customized theme" \
	--url "$URL" \
	--maintainer "$MAINTAINER" \
	--after-install $NAME/postinst \
	$NAME=/boot/grub/themes
