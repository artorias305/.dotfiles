#!/bin/bash

echo "Arch Linux setup script"

set -e

if [ "$EUID" -eq 0 ]; then
	echo -e "Error: This script should not be run as root"
	exit 1
fi

echo -e "Updating system..."
sudo pacman -Syu --noconfirm

echo -e "Installing base-devel and git..."
sudo pacman -S --needed base-devel git --noconfirm

if ! command -v yay &> /dev/null; then
	echo -e "Installing yay..."
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay
	makepkg -si --noconfirm
	cd -
	rm -rf /tmp/yay
else
	echo -e "yay is already installed"
fi

PKGS=(
	"neovim"
	"tmux"
	"zsh"
	"sway"
	"kitty"
	"ghostty"
	"rofi"
	"htop"
	"yazi"
	"ttf-iosevka-nerd"
	"librewolf"
)

echo -e "Installing packages..."
yay -S --needed --noconfirm "${PKGS[@]}"
