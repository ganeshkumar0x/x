# README.md

Stable configuration for a minimal Debian/X11 environment using cwm (Calm Window Manager).

## Overview

- `scripts/sys_setup.sh`: System-level dependency installation and configuration.
- `scripts/dot_setup.sh`: User-level symlinking of configuration files.
- `dotfiles/`: Directory containing all configuration files.

## Deployment

### 1. Permissions

Grant execution rights to the setup scripts:

`chmod +x scripts/*.sh`

### 2. System Installation

Install the required packages and configure the system:

`./scripts/sys_setup.sh`

This script configures iwd, systemd-resolved, and GRUB. Review these settings before running, particularly if another network manager is already configured.

### 3. Dotfile Configuration

Symlink the configuration files into `$HOME` and `$HOME/.config/`:

`./scripts/dot_setup.sh`

Back up existing configuration files before running, as existing destination files may be replaced.

## Initialization

From a Linux virtual console (TTY), start the X11 session:

`startx`
