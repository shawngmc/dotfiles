#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

if (( $(support_conda) == 0 )); then
  activate_default_conda;
fi

echo "Installing powerline..."
python3 -m pip install --user powerline-status powerline-kubernetes

#echo "Adding .bashrc.d file...";
#cat << 'EOF' > ~/.bashrc.d/powerline.sh
##!/bin/bash
#conda activate base
#POWERLINE_PATH=$(python3 -m pip show powerline-status | grep "Location:" | sed "s/Location: //")/powerline
#if [ -f ${POWERLINE_PATH}/bindings/bash/powerline.sh ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  PROMPT_COMMAND=""
#  source ${POWERLINE_PATH}/bindings/bash/powerline.sh
#fi
#EOF
source ~/.bashrc.d/powerline.sh

#echo "Copy the default configs to homedir..."
#mkdir -pv ~/.config/powerline/colorschemes
#mkdir -pv ~/.config/powerline/themes/shell
#POWERLINE_PATH=$(python3 -m pip show powerline-status | grep "Location:" | sed "s/Location: //")/powerline
#cp ${POWERLINE_PATH}/config_files/colorschemes/default.json ~/.config/powerline/colorschemes/
#cp ${POWERLINE_PATH}/config_files/colorschemes/solarized.json ~/.config/powerline/colorschemes/
#cp ${POWERLINE_PATH}/config_files/themes/shell/default.json ~/.config/powerline/themes/shell/

#echo "Adding k8s to the groups block in ~/.config/powerline/colorschemes/default.json..."
#jq '.groups += {"kubernetes_cluster": { "fg": "gray10", "bg": "darkestblue",  "attrs": [] }}' ~/.config/powerline/colorschemes/default.json > ~/.config/powerline/colorschemes/default.json.tmp
#mv ~/.config/powerline/colorschemes/default.json.tmp ~/.config/powerline/colorschemes/default.json
#jq '.groups += {"kubernetes_cluster:alert": { "fg": "gray10", "bg": "darkestred",  "attrs": [] }}' ~/.config/powerline/colorschemes/default.json > ~/.config/powerline/colorschemes/default.json.tmp
#mv ~/.config/powerline/colorschemes/default.json.tmp ~/.config/powerline/colorschemes/default.json
#jq '.groups += {"kubernetes_namespace": { "fg": "gray10", "bg": "darkestblue", "attrs": [] }}' ~/.config/powerline/colorschemes/default.json > ~/.config/powerline/colorschemes/default.json.tmp
#mv ~/.config/powerline/colorschemes/default.json.tmp ~/.config/powerline/colorschemes/default.json
#jq '.groups += {"kubernetes_namespace:alert": { "fg": "gray10", "bg": "darkred",     "attrs": [] }}' ~/.config/powerline/colorschemes/default.json > ~/.config/powerline/colorschemes/default.json.tmp
#mv ~/.config/powerline/colorschemes/default.json.tmp ~/.config/powerline/colorschemes/default.json
#jq '.groups += {"kubernetes:divider": { "fg": "gray4",  "bg": "darkestblue", "attrs": [] }}' ~/.config/powerline/colorschemes/default.json > ~/.config/powerline/colorschemes/default.json.tmp
#mv ~/.config/powerline/colorschemes/default.json.tmp ~/.config/powerline/colorschemes/default.json

#echo "Adding k8s to the left segments in ~/.config/powerline/themes/shell/default.json..."
#jq '.segments.left[.segments.left| length] |= . + {
#    "function": "powerline_kubernetes.kubernetes",
#    "priority": 30,
#    "args": {
#        "show_kube_logo": true,
#        "show_cluster": true,
#        "show_namespace": true,
#        "show_default_namespace": false,
#        "alerts": [
#          "live",
#          "cluster:live"
#        ]
#    }
#}' ~/.config/powerline/themes/shell/default.json > ~/.config/powerline/themes/shell/default.json.tmp
#mv ~/.config/powerline/themes/shell/default.json.tmp ~/.config/powerline/themes/shell/default.json

echo "Restarting the daemon..."
powerline-daemon --replace

echo "Powerline should appear in all new shells."
