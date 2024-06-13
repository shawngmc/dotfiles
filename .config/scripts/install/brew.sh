#!/bin/bash

source "$(dirname $0)/../util/helper.sh"

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

DETECTED_PACKAGE_MANAGER=$(detect_package_manager);
case "${DETECTED_PACKAGE_MANAGER}" in
  apt)
    sudo apt-get install build-essential -y
    ;;

  dnf)
    sudo dnf install make automake gcc gcc-c++ kernel-devel
    ;;

  *)
    echo "Unclear how package manager ${DETECTED_PACKAGE_MANAGER} works, but I don't handle it yet..." >&2;
    exit 1;
    ;;
esac

brew install gcc
