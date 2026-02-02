#!/bin/sh

echo "####################"
echo "#  INSTALL SCRIPT  #"
echo "####################"

PACKAGES="
   bc \
   btop \
   chezmoi \
   dbus \
   feh \
   firefox \
   flameshot \
   git \
   glxinfo \
   kitty \
   mesa \
   mesa-demos \
   neovim \
   openbox \
   rofi \
   xclip \
   xorg \
   zsh 
"

read -p "INSTALL PACKAGES? (y/N) " user_input
case "$user_input" in
   [yY])
      echo "INSTALLING..." &&\
      sudo xbps-install -Su $PACKAGES
      ;;
   *)
      echo "NOT INSTALLING"
      ;;
esac
echo ""

