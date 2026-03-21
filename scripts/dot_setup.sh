#!/bin/sh
# dot_setup.sh

# Path to the directory where this script lives
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# Path to dotfiles (one level up from scripts/)
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")/dotfiles"

# Standard home-directory dotfiles
FILES=".bashrc .img.jpg .tmux.conf .vimrc .xinitrc .cwmrc"

echo "=== Symlinking dotfiles ==="
for file in $FILES; do
    SRC="$DOTFILES_DIR/$file"
    DEST="$HOME/$file"

    if [ -e "$SRC" ]; then
        ln -sf "$SRC" "$DEST"
        echo "Linked $file -> $DEST"
    else
        echo "Warning: $file not found in $DOTFILES_DIR"
    fi
done

# Alacritty configuration
echo "=== Setting up Alacritty config ==="
ALAC_DIR="$HOME/.config/alacritty"
mkdir -p "$ALAC_DIR"
if [ -e "$DOTFILES_DIR/alacritty.toml" ]; then
    ln -sf "$DOTFILES_DIR/alacritty.toml" "$ALAC_DIR/alacritty.toml"
    echo "Linked alacritty.toml -> $ALAC_DIR/"
fi

echo "Dotfile setup finished."
