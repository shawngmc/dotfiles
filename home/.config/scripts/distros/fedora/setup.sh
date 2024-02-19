#!/bin/bash

PACKAGES=()

# Neofetch - system info at-a-glance in CLI for .bashrc
PACKAGES+=("neofetch")

# wl-clipboard - CLI Clipboard tools for wayland
PACKAGES+=("wl-clipboard")

# Glances - top alternative
PACKAGES+=("glances")

# Hyperfine - benchmark a CLI command
PACKAGES+=("hyperfine")

# httpie - HTTP 'for humans' CLI
PACKAGES+=("httpie")

# Diffing hexeditor
PACKAGES+=("dhex")

# CLI Spreadsheet
PACKAGES+=("sc-im")

# Testssl.sh
PACKAGES+=("testssl")

# HTTP server load tester
PACKAGES+=("siege")

# PDF Toolkit
PACKAGES+=("pdftk")

sudo yum install -y ${PACKAGES[@]}


# Symlink editor
sudo alternatives --install /usr/bin/editor nvim /bin/nvim 1
