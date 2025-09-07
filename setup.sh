#!/bin/bash

# Arch Linux setup script
# Installs yay, customizable packages, and moves dotfiles from script directory to correct locations

# Exit on error
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    echo -e "${RED}Error: This script should not be run as root${NC}"
    exit 1
fi

# Update system
echo -e "${GREEN}Updating system...${NC}"
sudo pacman -Syu --noconfirm

# Install base-devel and git if not already installed
echo -e "${GREEN}Installing base-devel and git...${NC}"
sudo pacman -S --needed base-devel git --noconfirm

# Install yay
if ! command -v yay &> /dev/null; then
    echo -e "${GREEN}Installing yay...${NC}"
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
else
    echo -e "${GREEN}yay is already installed${NC}"
fi

# List of packages to install (customizable)
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

# Install packages
echo -e "${GREEN}Installing packages...${NC}"
yay -S --needed --noconfirm "${PKGS[@]}"

# Dotfiles setup
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES=(
    ".zshrc"
    ".tmux.conf"
    ".config/kitty"
    ".config/sway"
    ".config/i3blocks"
)

echo -e "${GREEN}Moving dotfiles from $SCRIPT_DIR to correct locations...${NC}"

# Move dotfiles to their correct locations
for file in "${DOTFILES[@]}"; do
    target="$HOME/$file"
    source="$SCRIPT_DIR/$(basename "$file")"
    if [ -f "$source" ] || [ -d "$source" ]; then
        mkdir -p "$(dirname "$target")"
        if [ -f "$target" ] || [ -d "$target" ] || [ -L "$target" ]; then
            echo -e "${GREEN}Backing up existing $target${NC}"
            mv "$target" "${target}.bak"
        fi
        echo -e "${GREEN}Moving $source to $target${NC}"
        mv "$source" "$target"
    else
        echo -e "${RED}Warning: $source not found, skipping${NC}"
    fi
done

# Install Oh My Zsh (optional, comment out if not needed)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${GREEN}Installing Oh My Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Set zsh as default shell (optional, comment out if not needed)
if [ "$SHELL" != "$(which zsh)" ]; then
    echo -e "${GREEN}Setting zsh as default shell...${NC}"
    chsh -s "$(which zsh)"
fi

echo -e "${GREEN}Setup complete! Dotfiles have been moved to their correct locations${NC}"
echo -e "${GREEN}You may need to log out and back in for shell changes to take effect${NC}"
