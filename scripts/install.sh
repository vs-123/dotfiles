#!/bin/sh

echo "####################"
echo "#  INSTALL SCRIPT  #"
echo "####################"

PKGS="
   bc \
   btop \
   chezmoi \
   firefox \
   git \
   neovim \
   xclip \
   zsh 
"

GRPHCL_PKGS="
   dbus \
   feh \
   firefox \
   flameshot \
   glxinfo \
   kitty \
   mesa \
   mesa-demos \
   openbox \
   rofi \
   xorg \
"

read -p "INSTALL PACKAGES? (y/N) " user_input
case "$user_input" in
   [yY])
      echo "INSTALLING..." &&\
      sudo xbps-install -Syu $PKGS
      ;;
   *)
      echo "NOT INSTALLING"
      ;;
esac
echo ""

read -p "INSTALL GRAPHICAL PACKAGES? (y/N) " user_input
case "$user_input" in
   [yY])
      echo "INSTALLING..." &&\
      sudo xbps-install -Syu $GRPHCL_PKGS
      ;;
   *)
      echo "NOT INSTALLING"
      ;;
esac
echo ""

