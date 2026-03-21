# README.md

Stable configuration for a cwm (Calm Window Manager) environment.

## Overview
- `scripts/sys_setup.sh`: System-level dependency installation (apt).
- `scripts/dot_setup.sh`: User-level symlinking of configuration files.
- `dotfiles/`: Directory containing all raw configuration files.

## Deployment

### 1. Permissions
Grant execution rights to the setup scripts:
`$ chmod +x scripts/*.sh`

### 2. System Installation
Install necessary packages, X11 environment, and compilers:
`$ ./scripts/sys_setup.sh`

### 3. Dotfile Configuration
Link the configurations to `$HOME` and `.config/`:
`$ ./scripts/dot_setup.sh`

## Group Access
Ensure your user has hardware access for brightness and audio:
`$ sudo usermod -aG video,audio $USER`

## Initialization
Exit any current session and initialize the environment:
`$ startx`
