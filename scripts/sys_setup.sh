#!/bin/sh
# sys_setup.sh

# Disable lightdm if you're using startx instead of a display manager
# sudo systemctl disable lightdm

# Edit GRUB config and update (for disabling graphical boot, etc.)
# sudo vim /etc/default/grub
# sudo update-grub

echo "Updating package lists..."
sudo apt update

echo "Installing stable suite packages..."
sudo apt install -y \
    alacritty \
    alsa-utils \
    arandr \
    brightnessctl \
    build-essential \
    curl \
    cwm \
    dzen2 \
    firefox-esr \
    fonts-hack \
    fzf \
    git \
    hsetroot \
    i3lock \
    iw \
    mpv \
    mupdf \
    nodejs \
    nsxiv \
    scrot \
    tmux \
    tree \
    unclutter \
    vim-gtk3 \
    xclip \
    xcompmgr \
    xinit \
    xinput \
    xorg \
    xterm

# Create x symlink
sudo ln -sf "$(which startx)" /usr/bin/x

echo "System setup complete."
