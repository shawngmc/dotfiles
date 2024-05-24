#!/bin/bash

source ../util/helper.sh

echo "Installing fastfetch from package repo...";
install_package fastfetch;

echo "Creating config...";
fastfetch --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Display:DE:WM:Terminal:TerminalFont:CPU:GPU:Memory:Swap:Disk:LocalIp:Battery:PowerAdapter:Locale:Break:Colors --gen-config

echo "Adding .bashrc.d file...";
cat << 'EOF' > ~/.bashrc.d/fastfetch.sh
#!/bin/bash

# Run fastfetch if present
FASTFETCH_PATH=$(which fastfetch)
if [ $? -eq 0 ]; then
  fastfetch
fi
EOF
