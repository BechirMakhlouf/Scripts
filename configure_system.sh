#!/usr/bin/env bash


# set terminus font
echo "FONT=ter-222n.psf.gz" >> /etc/vconsole.conf

# remove pcspkr 
echo "blacklist pcspkr" >> /etc/modprobe.d/nobeep.conf

# set zsh as default shell
sudo -u $(whoami) chsh --shell /usr/bin/zsh 

# configure grub
echo "1. enable modprobe"

# configure fstab

# configure bluetooth

# fix qt themes
echo "QT_QPA_PLATFORMTHEME=qt5ct" >> /etc/environment

# configure root zsh and nvim configs

