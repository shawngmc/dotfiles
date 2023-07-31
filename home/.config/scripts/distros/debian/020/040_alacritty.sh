#!/bin/bash

# Install alacritty and tabbed
sudo apt install alacritty tabbed -y

# Modify Desktop file to run with tabbed
sed -i "s/Exec=.*/Exec=tabbed alacritty --embed/g" ~/.local/share/applications/Alacritty.desktop
