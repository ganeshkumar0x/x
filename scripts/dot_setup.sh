#!/usr/bin/env bash
# dot_setup.sh

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname -- "$SCRIPT_DIR")/dotfiles"

FILES=(
    .bashrc
    .img.jpg
    .tmux.conf
    .vimrc
    .xinitrc
    .cwmrc
)

echo "Symlinking dotfiles"

for file in "${FILES[@]}"; do
    src="$DOTFILES_DIR/$file"
    dest="$HOME/$file"

    if [[ -e "$src" ]]; then
        ln -sfnT "$src" "$dest"
        echo "$dest -> $src"
    else
        echo "missing: $src" >&2
    fi
done

ALACRITTY_DIR="$HOME/.config/alacritty"
mkdir -p "$ALACRITTY_DIR"

if [[ -e "$DOTFILES_DIR/alacritty.toml" ]]; then
    ln -sfnT "$DOTFILES_DIR/alacritty.toml" "$ALACRITTY_DIR/alacritty.toml"
    echo "$ALACRITTY_DIR/alacritty.toml -> $DOTFILES_DIR/alacritty.toml"
else
    echo "missing: $DOTFILES_DIR/alacritty.toml" >&2
fi

echo "Done"
