#!/bin/bash

wget -O /tmp/vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'

sudo dpkg -i /tmp/vscode.deb

rm /tmp/vscode.deb
