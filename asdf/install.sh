#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
This script installs the asdf version manager on macOS or Linux systems.

Description: 
  - This script installs the asdf version manager on macOS or Linux systems.
  - It checks if the current shell is bash, verifies if asdf is already installed, and then proceeds with the installation if necessary.

Usage:
  1. Ensure you have git installed on your system.
  2. Make the script executable: chmod +x asdf_installer.sh
  3. Run the script: ./asdf_installer.sh

Created Date: 2024/07/31 FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

function check_bash() {
  if [ "${SHELL##*/}" != 'bash' ]; then
    echo 'This script is only bash.'
    exit 1
  fi
}

function exists_command() {
  if command -v asdf > /dev/null 2>&1; then
    echo 'asdf is already installed.'
    exit 0
  fi
}

function run_linux() {
  local asdf_targets=("$@")
  for each in "${asdf_targets[@]}"; do
    eval "${each}"
    echo "${each}" >>"${HOME}/.bashrc"
  done
}

function install_asdf() {
  local asdf_targets=(
    'source ${HOME}/.asdf/asdf.sh'
    'source ${HOME}/.asdf/completions/asdf.bash'
  )

  if [ "$(uname)" == 'Darwin' ]; then
    git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf
  elif [ "$(uname)" == 'Linux' ]; then
    git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf
    run_linux "${asdf_targets[@]}"
  else
    echo "$(uname) is not supported." 1>&2
    exit 1
  fi
}

function main() {
  check_bash
  exists_command
  install_asdf

  exit 0
}

# Call the main function only if the script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi
