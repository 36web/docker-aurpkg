#!/bin/bash
sudo pacman -Sy --noconfirm
USER_ID=${USER_ID:=`id -u`}
GROUP_ID=${GROUP_ID:=`id -g`}
PACKAGE_NAME=$1
curl -sL https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz | tar -xz \
&& cd $PACKAGE_NAME \
&& makepkg -sc --noconfirm \
&& sudo mkdir /pkg/$PACKAGE_NAME \
&& sudo mv $1*.pkg.tar.xz PKGBUILD /pkg/$PACKAGE_NAME/ \
&& sudo chown -R $USER_ID:$GROUP_ID /pkg/$PACKAGE_NAME
