#!/bin/bash
# =============================================================================
#  Simple Arch v2 - Master Installer (Farook's Way)
# =============================================================================

set -e

# --- Keep sudo alive loop ---
function keep_sudo_alive() {
  while true; do sudo -v; sleep 60; done 2>/dev/null &
  SUDO_PID=$!
  trap 'kill $SUDO_PID' EXIT
}

# --- Check dependency ---
if ! command -v dialog &> /dev/null; then
  echo "Installing dependency: dialog..."
  sudo pacman -S --needed --noconfirm dialog
fi

# --- Welcome Message ---
dialog --colors \
  --backtitle "System Configuration Master Script" \
  --title "Welcome to Simple Arch Setup" \
  --yes-label "Yes, Continue" \
  --no-label "Exit" \
  --yesno "\Z5This script will build your complete environment using a modular setup.\n\n\Z1[IMPORTANT] You will be asked for your SUDO password ONCE.\n\Z0After that, the entire process is fully automated.\n\nReady to build?" \
  15 65 || exit 1

# --- Trigger Sudo Cache ---
echo "Please enter your sudo password to begin automated installation:"
sudo -v
keep_sudo_alive

# --- Execute Modules in Order ---
MODULES_DIR="$HOME/simple_arch/modules"

chmod +x "$MODULES_DIR"/*.sh

sh "$MODULES_DIR/01_core_tools.sh"
sh "$MODULES_DIR/02_sound_system.sh"
sh "$MODULES_DIR/03_fonts_assets.sh"
sh "$MODULES_DIR/04_user_apps.sh"      # 🌟 รันแอปเสริมของพี่ต่อท้ายสุด

# --- Finish and Goodbye ---
dialog --clear --colors \
  --title "Success! Operation Completed" \
  --backtitle "Reboot Required" \
  --msgbox "Your customized Arch Linux environment and post-install apps have been setup successfully.\n\nClick OK to reboot your system!" \
  12 60

clear
echo "Rebooting system now..."
sleep 2s
reboot
