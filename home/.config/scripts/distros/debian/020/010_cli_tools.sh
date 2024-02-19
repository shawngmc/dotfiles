#!/bin/bash
PACKAGES=()

# wl-clipboard - CLI Clipboard tools for wayland
PACKAGES+=("wl-clipboard")

# Glances - top alternative
PACKAGES+=("glances")

# Hyperfine - benchmark a CLI command
PACKAGES+=("hyperfine")

# goaccess - Live web log analysis tool
PACKAGES+=("goaccess")

# mc - TUI file manager
PACKAGES+=("mc")

# Diffing hexeditor
PACKAGES+=("dhex")

# HTTP server load tester
PACKAGES+=("siege")

# PDF Toolkit
PACKAGES+=("pdftk")

sudo apt install -y ${PACKAGES[@]}


echo "*: Custom .bashrc should pick up and run this now."
