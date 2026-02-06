#!/bin/sh

echo "####################"
echo "#  INSTALL SCRIPT  #"
echo "####################"

ipkgp() {
   pkgctgry=$1
   pkgs=$2

   pkgctgry_uppr=$(echo "$pkgctgry" | tr [:lower:] [:upper:])
   echo "$pkgctgry_uppr PACKAGES : $pkgs"

   echo "INSTALL $pkgctgry_uppr PACKAGES? (y/N) " 
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
   xclip \
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
   xorg 
"

ipkgp "GENERAL" "$GNRL_PKGS"
ipkgp "DEVELOPMENT" "$DEV_PKGS"
ipkgp "GRAPHICAL" "$GRPHCL_PKGS"

