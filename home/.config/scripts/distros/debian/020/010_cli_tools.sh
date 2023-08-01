#!/bin/bash

echo "Installing:"
echo "- glances: TUI system monitor"
echo "- mc: TUI file manager"
echo "- neofetch*: Shell system summary"
echo "- powerline*: Shell Prompt Improvements"
echo "- vim-nox: vim with Python3 bindings"
sudo apt install powerline vim-nox glances mc neofetch -y

echo "*: Custom .bashrc should pick up and run this now."
