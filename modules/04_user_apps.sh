#!/bin/bash
# =============================================================================
#  [Module 04] Core User Applications & Developer Environment
# =============================================================================
set -e

echo "=========================================="
echo " Starting Module 04: User Apps & Dev Tools"
echo "=========================================="

# -----------------------------------------------------------------------------
#  1. ESSENTIAL USER APPLICATIONS (Apps requested: Screenshot, Office, Utils)
# -----------------------------------------------------------------------------
CORE_USER_APPS=(
  "spectacle"              # Screenshot utility
  "galculator"             # Lightweight desktop calculator
  "libreoffice-fresh-th"   # Office Suite with Thai language support
  "simple-scan"            # Scanner utility[cite: 3]
  "gparted"                # Disk partition manager[cite: 3]
  "filezilla"              # FTP client for web hosting management[cite: 3]
  "gthumb"                 # Image viewer and browser[cite: 3]
  "vlc"                    # Media player with full codec support[cite: 3]
  "vlc-plugins-all"        # Additional VLC plugins[cite: 3]
  "obs-studio"             # Screen recorder and streaming tool[cite: 3]
)

# -----------------------------------------------------------------------------
#  2. DEVELOPER ENVIRONMENT & TEXT EDITORS
# -----------------------------------------------------------------------------
DEV_ENVIRONMENT=(
  "code"                   # VS Code OSS version[cite: 3]
  "neovim"                 # Modern Vim-based text editor[cite: 3]
  "tmux"                   # Terminal multiplexer[cite: 3]
  "docker"                 # Containerization backend[cite: 3]
  "docker-compose"         # Multi-container Docker management[cite: 3]
  "nodejs"                 # JavaScript runtime for Next.js workflow[cite: 3]
  "npm"                    # Node package manager[cite: 3]
  "yarn"                   # Alternative node package manager[cite: 3]
  "composer"               # PHP dependency manager for Laravel[cite: 3]
  "dbeaver"                # Universal database GUI tool[cite: 3]
  "sqlitebrowser"          # SQLite database GUI browser[cite: 3]
  "postman-bin"            # API client testing tool[cite: 3]
  "ollama"                 # Local AI model manager[cite: 3]
)

# -----------------------------------------------------------------------------
#  3. BROWSERS & POWER TOOLS
# -----------------------------------------------------------------------------
INTERNET_POWER_TOOLS=(
  "google-chrome"          # Main web browser[cite: 3]
  "firefox"                # Secondary web browser[cite: 3]
  "chromium"               # Open-source engine browser[cite: 3]
  "yazi"                   # Ultra-fast terminal file manager[cite: 3]
  "fastfetch"              # System information display[cite: 3]
  "yt-dlp"                 # Advanced YouTube download CLI tool[cite: 3]
)

# -----------------------------------------------------------------------------
#  4. EXECUTE INSTALLATION VIA PACMAN
# -----------------------------------------------------------------------------
echo "--> Installing Core User Apps..."
sudo pacman -S --needed --noconfirm "${CORE_USER_APPS[@]}"

echo "--> Deploying Web Developer Environment..."
sudo pacman -S --needed --noconfirm "${DEV_ENVIRONMENT[@]}"

echo "--> Installing Web Browsers and Utilities..."
sudo pacman -S --needed --noconfirm "${INTERNET_POWER_TOOLS[@]}"

# -----------------------------------------------------------------------------
#  5. SYSTEM SERVICE AUTOMATION
# -----------------------------------------------------------------------------
echo "--> Setting up system services..."

# Activate Docker daemon immediately
if command -v docker &> /dev/null; then
  echo "Enabling and starting Docker service..."
  sudo systemctl enable --now docker
  sudo usermod -aG docker "$USER" || true
fi

# Activate Ollama AI service background runner
if command -v ollama &> /dev/null; then
  echo "Enabling and starting Ollama background AI service..."
  sudo systemctl enable --now ollama
fi

echo "=========================================="
echo " Module 04 completed successfully!"
echo "=========================================="
