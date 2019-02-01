#!/bin/bash

USER_ID=${USER_ID:=`id -u`}
GROUP_ID=${GROUP_ID:=`id -g`}
PACKAGE_NAME=$1

sudo pacman -Sy --noconfirm

curl -sL https://aur.archlinux.org/cgit/aur.git/snapshot/$PACKAGE_NAME.tar.gz | tar -xz \
  && cd $PACKAGE_NAME \
  && makepkg -s --noconfirm \
  && sudo mkdir -p /pkg/$PACKAGE_NAME \
  && sudo mv -f $(makepkg --packagelist) PKGBUILD /pkg/$PACKAGE_NAME/ \
  && sudo chown -R $USER_ID:$GROUP_ID /pkg/$PACKAGE_NAME
