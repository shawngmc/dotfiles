#!/bin/bash

source ../util/helper.sh

if (( is_airgapped = 1 )); then
  VERSION="3.0.8"
  TARBALL="testssl.sh-${VERSION}.tar.gz"
  curl -LJO "https://testssl.sh/${TARBALL}"
  
  mkdir -pv ~/.local/apps/testssl
  mkdir -pv ~/.local/bin
  
  tar -xvf ${TARBALL} --strip-components 1 -C ~/.local/apps/testssl
  
  ln -s ~/.local/apps/testssl/testssl.sh ~/.local/bin/testssl 
else
  case detect_os_version in
    fedora)
    rhel)
    rocky)
      echo "Installing older version from package repo...";
      install_package testssl;
    ubuntu)
    debian)
    *)
      echo "No testssl package is available for this OS." >&2;
      exit 1;
      ;;
  esac
}
fi
