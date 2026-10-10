#!/usr/bin/env bash
# sys_setup.sh

set -euo pipefail

sudo apt update

sudo apt install -y \
    alacritty \
    alsa-utils \
    arandr \
    brightnessctl \
    build-essential \
    curl \
    cwm \
    firefox-esr \
    fonts-hack \
    fzf \
    git \
    hsetroot \
    i3lock \
    iw \
    iwd \
    mpv \
    mupdf \
    nodejs \
    nsxiv \
    ripgrep \
    scrot \
    systemd-resolved \
    tmux \
    tree \
    unclutter \
    vim-gtk3 \
    xclip \
    xcompmgr \
    xinit \
    xinput \
    xorg

sudo mkdir -p /etc/iwd
printf "[General]\nEnableNetworkConfiguration=true\n" | sudo tee /etc/iwd/main.conf

sudo systemctl enable --now iwd
sudo systemctl enable --now systemd-resolved
sudo ln -sfnT /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
sudo update-grub

STARTX_PATH="$(command -v startx)"
sudo ln -sfnT "$STARTX_PATH" /usr/bin/x

echo "Done"
