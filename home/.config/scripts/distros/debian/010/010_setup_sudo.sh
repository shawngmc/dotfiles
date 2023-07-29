#!/bin/bash

echo "Install/setup sudo as current user..."
su -c "apt install sudo -y"
su -c "adduser $USER sudo"

# Warn myself to logout/in
echo "If in a window manager, log out and back in to reload groups in other terminals!"

