#!/bin/bash
# =============================================================================
#  [Module 03] Fonts, Assets Deployment & DWM Compilation
# =============================================================================
set -e

echo "=========================================="
echo " Starting Module 03: Fonts & Assets Setup"
echo "=========================================="

# -----------------------------------------------------------------------------
#  1. INSTALL SYSTEM CORE FONTS
# -----------------------------------------------------------------------------
echo "--> Installing core and Thai typography fonts..."
# Core monospace nerd font and verified native Thai fonts (No floating vowels)
sudo pacman -S --needed --noconfirm \
  ttf-jetbrains-mono-nerd \
  opendesktop-fonts \
  ttf-ibm-plex \
  ttf-liberation \
  ttf-dejavu \
  noto-fonts-cjk \
  noto-fonts \
  noto-fonts-extra

# Refresh system font cache
echo "Updating font cache..."
fc-cache -fv

# -----------------------------------------------------------------------------
#  2. CLONE USER PERSONAL ASSETS (Fonts, Icons, Wallpapers)
# -----------------------------------------------------------------------------
echo "--> Fetching personal assets from GitLab repositories..."
cd "$HOME"

# Deploy custom fonts
git clone https://gitlab.com/farookphuket/my_fonts.git
cd my_fonts && sh copy_font.sh && cd "$HOME" && rm -rf "$HOME/my_fonts"

# Deploy custom icon themes
git clone https://gitlab.com/farookphuket/my_icons.git
cd my_icons && sh copy.sh && cd "$HOME" && rm -rf "$HOME/my_icons"

# Deploy curated wallpapers
git clone https://gitlab.com/farookphuket/my_wallpapers_less.git
cd my_wallpapers_less && sh setup.sh && cd "$HOME" && rm -rf "$HOME/my_wallpapers_less"

# -----------------------------------------------------------------------------
#  3. COPY CONFIGURATIONS & COMPILE SUCKLESS ENVIRONMENT
# -----------------------------------------------------------------------------
echo "--> Moving environment configurations into position..."
CONF_DIR="$HOME/.config"
REPO_CONFIG_DIR="$HOME/archlinux_my_config/CONFIG_FILES"

# Ensure target config folder exists
mkdir -p "$CONF_DIR"

# Source directories for compilation
DWM_SO="$REPO_CONFIG_DIR/dwm/"
DMENU_SO="$REPO_CONFIG_DIR/dmenu/"
ST_SO="$REPO_CONFIG_DIR/st/"
SL_SO="$REPO_CONFIG_DIR/slstatus/"
ALACRITTY_SO="$REPO_CONFIG_DIR/alacritty/"

# Deploy config directories
cp -r "$DWM_SO" "$DMENU_SO" "$ST_SO" "$SL_SO" "$ALACRITTY_SO" "$CONF_DIR/"

echo "--> Compiling Window Manager and custom terminals..."
# Compile Suckless environment tools cleanly with escalated installation permission
cd "$CONF_DIR/dwm/" && sudo make clean install
cd "$CONF_DIR/dmenu/" && sudo make clean install
cd "$CONF_DIR/st/" && sudo make clean install
cd "$CONF_DIR/slstatus/" && sudo make clean install

# Execute final configuration hooks provided by main asset repository
cd "$HOME/archlinux_my_config" && sh setup.sh

echo "=========================================="
echo " Module 03 completed successfully!"
echo "=========================================="
