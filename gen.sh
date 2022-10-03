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

fpm -s dir -t $TYPE -n $NAME -p src\
	-a all\
	-v $1\
	--description "Numigi GRUB bootloader customized theme."\
	--license $LICENSE\
	--maintainer $MAINTAINER\
	--url $URL\
	--after-install src/postinst\
	-d grub-theme-numigi

