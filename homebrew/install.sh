#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
This script installs Homebrew and a set of predefined packages on macOS.

USAGE:
  chmod +x install_homebrew.sh
  ./install_homebrew.sh

DESCRIPTION:
  - This script checks if Homebrew is installed on the system.
  - If Homebrew is not installed, it installs Homebrew.
  - It then updates Homebrew and installs a list of specified packages.
  - The script is designed to run only on macOS.

Created Date: 2024/07/31 FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

function install_homebrew() {
  command='brew'
  if which "${command}" > /dev/null 2>&1; then
    echo 'Homebrew is already installed.'
  else
    echo 'Homebrew is not installed. Installing Homebrew...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

function run_if_macos() {
  os_type=$(uname)

  if [ "${os_type}" != 'Darwin' ]; then
    echo "Homebrew installer is only for macOS." >&2
    exit 1
  fi
}

function install_packages () {
  echo 'Updating Homebrew...'
  brew update
  brew upgrade

  packages=(
    'xz'
    'wget'
    'zip'
    'unzip'
    'bash'
    'tree'
    'neovim'
    'gibo'
  )
  for package in "${packages[@]}"; do
    echo "Installing ${package}..."
    brew install "${package}"
  done
  brew cleanup 
  echo "All packages have been installed."
}

function main() {
  run_if_macos
  install_homebrew
  install_packages

  exit 0
}

# Call the main function only if the script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi
