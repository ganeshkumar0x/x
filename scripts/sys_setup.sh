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
    xorg

STARTX_PATH="$(command -v startx)"
sudo ln -sf "$STARTX_PATH" /usr/bin/x

echo "Done"
