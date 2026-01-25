#!/bin/sh

# Get the absolute path of the script's directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Step 1: Build suckless programs
SUCKLESS_DIR="$SCRIPT_DIR/suckless"
DIRS="dmenu dwm slock slstatus st"

echo "=== Building suckless programs ==="
for dir in $DIRS; do
    FULL_PATH="$SUCKLESS_DIR/$dir"
    if [ -d "$FULL_PATH" ]; then
        echo "Building $dir..."
        sudo make -C "$FULL_PATH" clean install
    else
        echo "Warning: Directory '$FULL_PATH' not found, skipping..."
    fi
done
echo "Suckless build completed."
echo ""

# Step 2: Symlink dotfiles using absolute paths
DOTFILES_DIR="$SCRIPT_DIR/dotfiles"
FILES=".bashrc .img.jpg .tmux.conf .vimrc .xinitrc"

echo "=== Symlinking dotfiles ==="
for file in $FILES; do
    SRC="$DOTFILES_DIR/$file"
    DEST="$HOME/$file"

    if [ -e "$SRC" ]; then
        ln -sf "$(realpath "$SRC")" "$DEST"
        echo "Linked $file -> $DEST"
    else
        echo "Warning: Dotfile '$SRC' not found, skipping..."
    fi
done
echo "Dotfile symlinking completed."

# Create x symlink
sudo ln -sf "$(which startx)" /usr/bin/x

echo "Setup finished."
