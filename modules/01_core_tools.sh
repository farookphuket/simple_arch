#!/bin/bash
# =============================================================================
#  [Module 01] Core Xorg Server, System Utilities & Nvidia Drivers
# =============================================================================
set -e

echo "=========================================="
echo " Starting Module 01: Core Tools & Display"
echo "=========================================="

# -----------------------------------------------------------------------------
#  1. XORG DISPLAY SERVER SYSTEM
# -----------------------------------------------------------------------------
echo "--> Installing Xorg Server and Display components..."
XORG_PACKAGES=(
  "xorg-server"          # Core X11 display server
  "xorg-server-common"   # Common files for Xorg
  "xorg-xinit"           # Simple X runner (startx)
  "xorg-xrdb"            # X server resource database utility (for .Xresources)[cite: 3]
  "xorg-xrandr"          # Monitor and screen resolution manager[cite: 3]
  "xorg-xprop"           # Property displayer for X (Needed for DWM hooks)[cite: 3]
  "xorg-xsetroot"        # Root window parameter setter (for statusbar)[cite: 3]
  "xorg-xinput"          # Runtime input device configuration[cite: 3]
  "xorg-xkill"           # Utility to kill misbehaving X windows[cite: 3]
  "xauth"                # X authority file utility
  "xclip"                # Command line interface to X selections (Clipboard)[cite: 3]
  "xsel"                 # Command line clipboard copy/paste utility[cite: 3]
  "arandr"               # Visual GUI front-end for XRandR[cite: 3]
)

sudo pacman -S --needed --noconfirm "${XORG_PACKAGES[@]}"

# -----------------------------------------------------------------------------
#  2. NVIDIA GRAPHICS DRIVERS (580xx Legacy / DKMS Series)
# -----------------------------------------------------------------------------
echo "--> Installing NVIDIA GPU Drivers and Utilities..."
NVIDIA_PACKAGES=(
  "nvidia-580xx-dkms"     # Kernel module for Nvidia graphics[cite: 3]
  "nvidia-580xx-utils"    # Core Nvidia userland utilities[cite: 3]
  "nvidia-580xx-settings" # Graphical configuration panel for Nvidia[cite: 3]
)

sudo pacman -S --needed --noconfirm "${NVIDIA_PACKAGES[@]}"

# -----------------------------------------------------------------------------
#  3. CLI POWER UTILITIES, TERMINALS & MULTIPLEXERS
# -----------------------------------------------------------------------------
echo "--> Installing CLI Power Utilities and Terminals..."
CLI_TOOLS=(
  "kitty"                 # Modern, GPU-accelerated terminal emulator[cite: 3]
  "alacritty"             # Fast, cross-platform terminal emulator[cite: 3]
  "btop"                  # Modern graphical resource monitor[cite: 3]
  "duf"                   # Disk usage utility with beautiful layout[cite: 3]
  "eza"                   # Modern replacement for 'ls' command[cite: 3]
  "bat"                   # Modern replacement for 'cat' command with syntax highlighting[cite: 3]
  "fd"                    # Simple, fast and user-friendly alternative to 'find'[cite: 3]
  "ripgrep"               # Fast line-oriented search tool (rg)[cite: 3]
  "fzf"                   # General-purpose command-line fuzzy finder[cite: 3]
  "ranger"                # Terminal file manager with VI keybindings[cite: 3]
  "rsync"                 # Fast and extraordinary versatile file-copying tool[cite: 3]
  "git"                   # Distributed version control system[cite: 3]
  "dialog"                # Script-driven interactive message boxes[cite: 3]
  "feh"                   # Light-weight image viewer (Used to set DWM wallpaper)[cite: 3]
  "picom"                 # X11 compositor (For transparency and shadows)[cite: 3]
)

sudo pacman -S --needed --noconfirm "${CLI_TOOLS[@]}"

# -----------------------------------------------------------------------------
#  4. NETWORK MANAGEMENT
# -----------------------------------------------------------------------------
echo "--> Setting up Network Manager utilities..."
sudo pacman -S --needed --noconfirm networkmanager network-manager-applet[cite: 3]
sudo systemctl enable --now NetworkManager

echo "=========================================="
echo " Module 01 completed successfully!"
echo "=========================================="
