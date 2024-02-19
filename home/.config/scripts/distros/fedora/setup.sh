#!/bin/bash

PACKAGES=()

# wl-clipboard - CLI Clipboard tools for wayland
PACKAGES+=("wl-clipboard")

# Glances - top alternative
PACKAGES+=("glances")

# Hyperfine - benchmark a CLI command
PACKAGES+=("hyperfine")

# Diffing hexeditor
PACKAGES+=("dhex")

# HTTP server load tester
PACKAGES+=("siege")

# PDF Toolkit
PACKAGES+=("pdftk")

sudo yum install -y ${PACKAGES[@]}


# Symlink editor
sudo alternatives --install /usr/bin/editor nvim /bin/nvim 1
