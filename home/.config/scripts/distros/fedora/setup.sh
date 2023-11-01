#!/bin/bash

PACKAGES=()

# Neofetch - system info at-a-glance in CLI for .bashrc
PACKAGES+=("neofetch")

# wl-clipboard - CLI Clipboard tools for wayland
PACKAGES+=("wl-clipboard")

# Glances - top alternative
PACKAGES+=("glances")

# Powerline - nice automatic prompt visual
PACKAGES+=("powerline")

# Neovim - better rebuild of vim
PACKAGES+=("neovim")

# Python3-neovim - Python3 support for Vim
PACKAGES+=("python3-neovim")

# Hyperfine - benchmark a CLI command
PACKAGES+=("hyperfine")

# httpie - HTTP 'for humans' CLI
PACKAGES+=("httpie")

sudo yum install -y ${PACKAGES[@]}


# Symlink editor
sudo alternatives --install /usr/bin/editor nvim /bin/nvim 1
