#!/bin/bash

source $(dirname "$0")/../util/helper.sh

if (( is_airgapped = 1 )); then
  brew install fastfetch
else
  echo "Installing older version from package repo...";
  install_os_package fastfetch;
fi

#echo "Creating config...";
#fastfetch --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Display:DE:WM:Terminal:TerminalFont:CPU:GPU:Memory:Swap:Disk:LocalIp:Battery:PowerAdapter:Locale:Break:Colors --gen-config

# echo "Adding .bashrc.d file...";
# cat << 'EOF' > ~/.bashrc.d/fastfetch.sh
# #!/bin/bash

# # Run fastfetch if present
# FASTFETCH_PATH=$(which fastfetch)
# if [ $? -eq 0 ]; then
#   fastfetch
# fi
# EOF
