#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

echo "Installing vscode..."
if (( $(is_airgapped) == 1 )); then
  DETECTED_PACKAGE_MANAGER=$(detect_package_manager);
  case "${DETECTED_PACKAGE_MANAGER}" in
    apt)
      FILETYPE=deb
      ;;

    dnf)
      FILETYPE=rpm
      ;;

    *)
      echo "Unclear how package manager ${DETECTED_PACKAGE_MANAGER} works, but I don't handle it yet..." >&2;
      exit 1;
      ;;
  esac
  FILENAME="/tmp/vscode.${FILETYPE}"
  URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-${FILETYPE}-x64"
  wget -O ${FILENAME} "${URL}"
  install_os_package_manual ${FILENAME}
  rm ${FILENAME}
else
  echo "VSCode isn't in package repos...";
  exit 1;
fi
