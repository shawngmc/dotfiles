$!/bin/bash

# /etc/os-release is the authoritative way to identify a linux distro
# Standard ref: https://www.freedesktop.org/software/systemd/man/latest/os-release.html
# DB of examples: https://github.com/which-distro/os-release

source /etc/os-release

# What I want to cover
# OS
# - RHEL or Rocky 8/9: Yes
# - Fedora EL8/9+: Yes
# - Debian 11/12: Yes
# - Ubuntu LTS (22.04, 24.04): Yes
# - Arch, Alpine, etc.: Not Yet
# - EL7 or below: No
# - Old Debian/Ubuntu/etc.: No
# ARCH
# - X86_64: Yes
# - ARM: Not Yet
# WINDOW SYSTEM
# - X: Not Yet
# - Wayland w/XWayland: Not Yet
# - Wayland only: Not Yet
# PACKAGE MANAGER
# - APT: Yes
# - DNF: Yes
# - Snap: Yes
# - Flatpak: Yes
# SHELL
# - Bash: Yes
# - Zsh/Fsh/etc.: No

# Check the CPU first, and just exit if not X86_64
get_proc_type() {
  DETECTED_PROC_TYPE="$(uname -p)";
  if [[ "${DETECTED_PROC_TYPE}" == "x86_64" ]]; then
    echo "Detected ${DETECTED_PROC_TYPE}..." >&2;
    echo "${DETECTED_PROC_TYPE}";
  else
    echo "Detected CPU type ${DETECTED_PROC_TYPE}, which I don't handle yet..." >&2;
    exit 1;
  fi
}

detect_package_manager() {
  DETECTED_OS=detect_supported_os;
  case "${DETECTED_OS}" in
    fedora)
    rocky)
    rhel)
      return "dnf";
      ;;

    ubuntu)
    debian)
      return "apt";
      ;;

    *)
      echo "Unclear what package manager ${DETECTED_OS} uses, but I don't handle it yet..." >&2;
      exit 1;
      ;;
  esac
}

find_exact_os_package() {
  PACKAGE=$1
  DETECTED_PACKAGE_MANAGER=detect_package_manager;
  case "${DETECTED_PACKAGE_MANAGER}" in
    apt)
      apt search ^${PACKAGE}$;
      ;;

    dnf)
      dnf repoquery-n ${PACKAGE};
      ;;

    *)
      echo "Unclear how package manager ${DETECTED_PACKAGE_MANAGER} works, but I don't handle it yet..." >&2;
      exit 1;
      ;;
  esac
}

install_os_package() {
  PACKAGE=$1
  DETECTED_PACKAGE_MANAGER=detect_package_manager;
  case "${DETECTED_PACKAGE_MANAGER}" in
    apt)
      apt install -y ${PACKAGE};
      ;;

    dnf)
      dnf install -y ${PACKAGE};
      ;;

    *)
      echo "Unclear how package manager ${DETECTED_PACKAGE_MANAGER} works, but I don't handle it yet..." >&2;
      exit 1;
      ;;
  esac
}

install_os_package_manual() {
  PACKAGE_PATH=$1
  DETECTED_PACKAGE_MANAGER=detect_package_manager;
  case "${DETECTED_PACKAGE_MANAGER}" in
    apt)
      apt install ${PACKAGE};
      ;;

    dnf)
      dnf localinstall -y ${PACKAGE_PATH};
      ;;

    *)
      echo "Unclear how package manager ${DETECTED_PACKAGE_MANAGER} works, but I don't handle it yet..." >&2;
      exit 1;
      ;;
  esac
}

detect_os() {
  case "${ID}" in
    fedora)
    rhel)
    rocky)
    ubuntu)
    debian)
      echo "Detected ${ID}..." >&2;
      echo "${ID}"
      ;;
  
    *)
      echo "ID ${ID} is not supported yet..." >&2;
      exit 1;
      ;;
  esac
}

detect_os_version() {
  # First, look at the ID field
  case "${ID}" in
    fedora)
      # This is Fedora, which has rough EL equivalency
      # https://docs.fedoraproject.org/en-US/quick-docs/fedora-and-red-hat-enterprise-linux/
      DETECTED_DISTRO="${ID}";
      echo "Detected ${ID}..." >&2;
      if [ -z ${PLATFORM_ID+x} ]; then 
        echo "PLATFORM_ID is not set, so either this is a very old Fedora or something is wrong with /etc/os_release." >&2;
        exit 1;
      else
        RELEASE_NUMBER=${PLATFORM_ID:10};
        if (( $RELEASE_NUMBER >= 34 )); then
          echo "Detected EL9..." >&2;
          echo "9";
        elif (( $RELEASE_NUMBER >= 28 )); then
          echo "Detected EL8..." >&2;
          echo "8";
        else
          echo "RELEASE_NUMBER ${RELEASE_NUMBER} is not detected or too low, so either this is a very old Fedora or something is wrong with /etc/os_release." >&2;
          exit 1;
        fi
      fi
      ;;
  
    rhel)
    rocky)
      DETECTED_DISTRO="${ID}";
      echo "Detected ${ID}..." >&2;
      if [ -z ${PLATFORM_ID+x} ]; then 
        echo "PLATFORM_ID is not set, so either this is a very old ${ID} or something is wrong with /etc/os_release." >&2;
        exit 1;
      else
        RELEASE_NUMBER=${PLATFORM_ID:11}
        if (( $RELEASE_NUMBER = 9 )); then
          echo "Detected EL9..." >&2;
          echo "9";
        elif (( $RELEASE_NUMBER = 8 )); then
          echo "Detected EL8..." >&2;
          echo "8";
        else
          echo "RELEASE_NUMBER ${RELEASE_NUMBER} is not detected or too low, so either this is a very old ${ID} or something is wrong with /etc/os_release." >&2;
          exit 1;
        fi
      fi
      ;;
  
    ubuntu)
      DETECTED_DISTRO="${ID}";
      echo "Detected ${ID}...";
      if [[ "${VERSION_ID}" =~ ^(24\.04|22\.04)$ ]]; then
        echo "Detected recent LTS ${VERSION_ID}..." >&2;
        echo "${VERSION_ID}";
      else
        echo "VERSION_ID ${VERSION_ID} is not a recent LTS or something is wrong with /etc/os_release." >&2;
        exit 1;
      fi
      ;;
  
    debian)
      DETECTED_DISTRO="${ID}"
      echo "Detected ${ID}..."
      if [[ "${VERSION_ID}" =~ ^(11|12)$ ]]; then
        echo "Detected recent ${VERSION_ID}..." >&2;
        echo "${VERSION_ID}";
      else
        echo "VERSION_ID ${VERSION_ID} is not a recent LTS or something is wrong with /etc/os_release." >&2;
        exit 1;
      fi
      DETECTED_PACKAGE_MANAGER="apt";
      ;;
  
    *)
      echo "ID ${ID} is not recognized yet..." >&2;
      exit 1;
      ;;
  esac
}

support_snap() {
  SNAP_RESPONSE=$(snap version);
  if (( $? = 0 )); then
    echo "Snap support detected..." >&2;
    echo 1;
  else
    echo "Snap support not found..." >&2;
    echo 0;
  fi
}

support_flatpak() {
  FLATPAK_RESPONSE=$(flatpak --version);
  if (( $? = 0 )); then
    echo "Flatpak support detected..." >&2;
    echo 0;
  else
    echo "Flatpak support not found..." >&2;
    echo 1;
  fi
}

support_conda() {
  CONDA_RESPONSE=$(conda list);
  if (( $? = 0 )); then
    echo "Conda support detected..." >&2;
    echo 0;
  else
    echo "Conda support not found..." >&2;
    echo 1;
  fi
}

activate_default_conda() {
  SUPPORTED=support_conda
  if (( $SUPPORTED = 0 )); then
    conda activate base;
  else
    echo "Conda support not found..." >&2;
    echo 1;
  fi
}

does_cli_tool_exist() {
  TOOL=$1
  CONDA_RESPONSE=$(which ${TOOL});
  if (( $? = 0 )); then
    echo "${TOOL} found..." >&2;
    echo 0;
  else
    echo "${TOOL} not found..." >&2;
    echo 1; 
  fi
}

is_airgapped() {
  echo "Airgapped check NYI..." >&2;
  echo 1;
}
