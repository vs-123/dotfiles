#!/bin/sh

echo "####################"
echo "#  INSTALL SCRIPT  #"
echo "####################"
echo ""
echo "* AUTHOR: vs-123 @ https://github.com/vs-123"
echo ""

ipkgp() {
   pkgctgry=$1
   pkgs=$2

   echo "$pkgctgry PACKAGES : $pkgs"

   echo "INSTALL $pkgctgry PACKAGES? (y/N) " 
   read usrinp
   case "$usrinp" in
      [yY])
         echo "INSTALLING..." && sudo xbps-install -Syu $pkgs
         ;;
      *)
         echo "NOT INSTALLING"
         ;;
   esac
   echo ""
}

GNRL_PKGS="
   bc \
   btop \
   chezmoi \
   git \
   neovim \
   zsh 
"

DEV_PKGS="
   cmake \
   clang \
   lua-language-server \
   cmake-language-server
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
   xclip \
   xorg 
"

ipkgp "GENERAL" "$GNRL_PKGS"
ipkgp "DEVELOPMENT" "$DEV_PKGS"
ipkgp "GRAPHICAL" "$GRPHCL_PKGS"

