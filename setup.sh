#!/bin/bash

# Arch Linux setup script
# Installs yay, customizable packages (including ly display manager), moves dotfiles from script directory to correct locations, and enables/starts ly

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
    "ly"
)

# Install packages
echo -e "${GREEN}Installing packages...${NC}"
yay -S --needed --noconfirm "${PKGS[@]}"

# Enable and start ly display manager
echo -e "${GREEN}Enabling and starting ly display manager...${NC}"
if ! systemctl is-enabled ly.service &> /dev/null; then
    sudo systemctl enable ly.service
    echo -e "${GREEN}ly display manager enabled${NC}"
else
    echo -e "${GREEN}ly is already enabled${NC}"
fi
if ! systemctl is-active ly.service &> /dev/null; then
    sudo systemctl start ly.service
    echo -e "${GREEN}ly display manager started${NC}"
else
    echo -e "${GREEN}ly is already running${NC}"
fi

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
            cp -r "$target" "${target}.bak"
        fi
        echo -e "${GREEN}Moving $source to $target${NC}"
        cp -r "$source" "$target"
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

echo -e "Cloning oh-my-zsh plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highliting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting

echo -e "${GREEN}Setup complete! Dotfiles have been moved to their correct locations${NC}"
echo -e "${GREEN}ly display manager is enabled and started. You may need to reboot for all changes to take effect${NC}"
