#!/usr/bin/env bash

CURR_USER="copernicus"

PACMAN_PACKAGES_LIST=( 'git' 'sudo' 'base' 'base-devel' 'neofetch' 'chromium' 'firefox' 'obsidian' 'qbittorrent' 'tldr' 'man' 'waybar' 'tldr' 'zsh' 'sheldon' 'code' 'gimp' 'nvim' 'yes' 'exa' 'bat' 'atuin' 'navi' 'thefuck' 'ranger' 'tmux' 'noto-fonts' 'lxappearance' 'qt5ct' 'discord' 'vlc' 'docker' 'xorg-xwayland' 'exfat-utils' 'ntfs-3g' 'fuse' 'fuse3' 'grub' 'runuser' 'efibootmgr' 'os-prober' 'bluez' 'bluez-utils' 'ssh' 'feh' 'fontconfig' 'pipewire' 'pipewire-pulse' 'wl-clipboard' 'syncthing' 'jq' 'parallel' 'fzf' 'kitty' 'sway' 'swaybg' 'swaylock' 'pavucontrol' 'wofi' 'btop' 'htop' 'ttf-go-nerd' 'diff-so-fancy' 'cronie' 'nodejs' 'npm' 'bun' 'python3' 'python-pip' 'go')

AUR_PACKAGES_LIST=( 'ly' 'fastfetch' 'nerdfetch' 'grimshot' 'postman' 'spotify-adblock' 'nerd-fonts-inter' 'dracula-gtk-theme' 'ttf-iosevka-nerd' 'ttf-jetbrains-mono-nerd' 'ttf-ubuntu-arabic')

SERVICES_TO_ENABLE=( 'NetworkManager' 'bluetooth' 'ly')

pacman -Syyu --noconfirm

for i in "${PACMAN_PACKAGES_LIST[@]}"; do
    PACMAN_PACKAGES_STR="$PACMAN_PACKAGES_STR $i"
done

echo $PACMAN_PACKAGES_STR
pacman --noconfirm -S $PACMAN_PACKAGES_STR

# remove previous yay install folder if it exists
rm -rf /tmp/install_yay/

# install yay aur helper
cd /tmp/ && mkdir install_yay && cd install_yay && pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

for i in "${AUR_PACKAGES_LIST[@]}"; do
    AUR_PACKAGES_STR="$AUR_PACKAGES_STR $i"
done

sudo -u $CURR_USER yay --answerdiff=None --noconfirm -S $AUR_PACKAGES_STR

echo "you need to enable these Packages: "

for i in "${SERVICES_TO_ENABLE[@]}"; do
    echo "- $i"
done
