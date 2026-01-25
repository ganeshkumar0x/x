#!/bin/sh

# Disable lightdm if you're using startx instead of a display manager
# sudo systemctl disable lightdm

# Edit GRUB config and update (for disabling graphical boot, etc.)
# sudo vim /etc/default/grub
# sudo update-grub

echo "Updating package lists..."
sudo apt update

echo "Installing all packages in single block..."
sudo apt install -y \
    alsa-utils \
    arandr \
    brightnessctl \
    build-essential \
    curl \
    dunst \
    firefox-esr \
    fonts-hack \
    fzf \
    git \
    hsetroot \
    libx11-dev \
    libx11-xcb-dev \
    libxcb-res0-dev \
    libxcb1-dev \
    libxft-dev \
    libxinerama-dev \
    libxrandr-dev \
    mpv \
    mupdf \
    nodejs \
    nsxiv \
    picom \
    scrot \
    tmux \
    tree \
    unclutter \
    vim-gtk3 \
    xclip \
    xfe \
    xinit \
    xinput \
    xorg

echo "Package installation complete!"
