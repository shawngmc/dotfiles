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

sudo yum install -y ${PACKAGES[@]}
