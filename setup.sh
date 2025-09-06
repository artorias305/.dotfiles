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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "Setting up dotfiles..."

cp ./.zshrc ~
cp ./.tmux.conf ~
cp ./sway/ ~/.config
cp ./rofi/ ~/.config
cp  ./i3blocks/ ~/.config

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo -e "Installing Oh My Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ""
	--unattended
fi

if [ "$SHELL" != "$(which zsh)" ]; then
	echo -e "Setting zsh as default shell..."
	chsh -s "$(which zsh)"
fi

echo -e "Setup complete. Please reboot your system."
