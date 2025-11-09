#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR/dotfiles"
USER_HOME="$HOME"

if [[ "$USER" != "rookie" ]]; then
    echo "Warning: Expected user 'rookie', but running as '$USER'"
    echo "Continuing with home directory: $USER_HOME"
    read -p "Press Enter to continue or Ctrl+C to abort..."
fi

echo "Starting setup process..."

echo "Creating configuration directories..."
mkdir -p "$USER_HOME/.config/{i3,i3status,alacritty}"

echo "Creating symlinks..."

ln -sf "$DOTFILES_DIR/.bashrc" "$USER_HOME/.bashrc"
ln -sf "$DOTFILES_DIR/.tmux.conf" "$USER_HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/.vimrc" "$USER_HOME/.vimrc"
ln -sf "$DOTFILES_DIR/.xinitrc" "$USER_HOME/.xinitrc"
ln -sf "$DOTFILES_DIR/.img.jpg" "$USER_HOME/.img.jpg"

ln -sf "$DOTFILES_DIR/alacritty.toml" "$USER_HOME/.config/alacritty/alacritty.toml"
ln -sf "$DOTFILES_DIR/i3-config" "$USER_HOME/.config/i3/config"
ln -sf "$DOTFILES_DIR/i3status-config" "$USER_HOME/.config/i3status/config"

echo "Dotfiles symlinks created successfully!"

echo "Starting system configuration..."

if command -v startx >/dev/null 2>&1; then
    echo "Creating startx shortcut..."
    sudo ln -sf "$(command -v startx)" /usr/bin/x
else
    echo "startx not found, skipping shortcut creation"
fi

if command -v systemctl >/dev/null 2>&1; then
    if systemctl is-enabled lightdm >/dev/null 2>&1; then
        echo "Disabling LightDM..."
        sudo systemctl disable lightdm
    fi
fi

echo "Installing packages..."
sudo apt update
sudo apt install -y \
    alsa-utils \
    brightnessctl \
    curl \
    dmenu \
    dunst \
    firefox-esr \
    fonts-hack \
    fzf \
    git \
    hsetroot \
    i3 \
    i3status \
    mpv \
    mupdf \
    nodejs \
    nsxiv \
    scrot \
    tmux \
    tree \
    vim-gtk3 \
    xclip \
    picom \
    xfe \
    arandr \
    alacritty \
    xinput

echo "Configuring GRUB..."
if [ -f /etc/default/grub ]; then
    if grep -q '^GRUB_TIMEOUT=' /etc/default/grub; then
        sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
    else
        echo 'GRUB_TIMEOUT=0' | sudo tee -a /etc/default/grub >/dev/null
    fi

    echo "Updating GRUB..."
    sudo update-grub
else
    echo "/etc/default/grub not found, skipping GRUB configuration"
fi

echo ""
echo "Setup complete!"
echo "Summary:"
echo "  - Dotfiles symlinks created in $USER_HOME"
echo "  - Configuration directories created"
echo "  - System packages installed"
echo "  - GRUB timeout set to 0"
echo ""
echo "You can now reboot your system."
