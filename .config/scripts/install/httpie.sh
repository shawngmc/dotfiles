#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

if (( $(is_airgapped) == 1 )); then
  if (( $(does_cli_tool_exist jq) == 1 )); then
    echo "JQ is required to install httpie from repo..." >&2;
    exit 1
  fi

  # Have to save pull from GH to protect newlines
  curl -s "https://api.github.com/repos/httpie/cli/releases/latest" -o ./httpie_latest.json
  HTTPIE_TAG=$(cat ./httpie_latest.json | grep tag_name)
  HTTPIE_TAG=${JQ_TAG:15:-2}
  echo "Pulling HTTPIE tag: ${HTTPIE_TAG}"

  HTTPIE_LATEST_URL=$(cat ./httpie_latest.json | jq -r '.assets[] | select(.name == "http") | .browser_download_url')
  rm ./httpie_latest.json
  echo $HTTPIE_LATEST_URL
  curl -LJO $HTTPIE_LATEST_URL
  chmod +x ./http
  mkdir -pv ~/.local/bin
  mv http ~/.local/bin/http
else
  echo "Installing older version from package repo...";
  install_package httpie;
fi
