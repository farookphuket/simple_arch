#!/bin/bash

echo "=========================================="
echo " [Module 02] Setting up PipeWire Sound..."
echo "=========================================="

# Remove old pulseaudio if exist
if pacman -Qs pulseaudio &>/dev/null; then
  sudo pacman -R --noconfirm pulseaudio-bluetooth pulseaudio || true
fi

# Install Pipewire full suite
sudo pacman -S --needed --noconfirm pipewire-audio pipewire-pulse wireplumber alsa-utils pavucontrol

# Activate WirePlumber
systemctl --user enable --now wireplumber || true
