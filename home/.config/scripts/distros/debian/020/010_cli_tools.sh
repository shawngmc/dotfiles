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

# goaccess - Live web log analysis tool
PACKAGES+=("goaccess")

# mc - TUI file manager
PACKAGES+=("mc")

# Diffing hexeditor
PACKAGES+=("dhex")

# Testssl.sh
PACKAGES+=("testssl.sh")

# HTTP server load tester
PACKAGES+=("siege")

# PDF Toolkit
PACKAGES+=("pdftk")

sudo apt install -y ${PACKAGES[@]}


echo "*: Custom .bashrc should pick up and run this now."
