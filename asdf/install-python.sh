#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
This shell script is designed to install Python using the asdf tool.

USAGE:
  chmod +x install_python.sh
  ./install_python.sh

DESCRIPTION:
  - Checks if asdf is installed. If not, it displays an error message and exits.
  - Checks if python is already installed. If it is, it displays a message and exits.
  - Installs python using asdf and sets it globally.

Created Date: 2024/01/14 FUKUOKA Keito
Updated Date: 2024/07/31 FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

function exists_asdf() {
  if ! command -v asdf > /dev/null 2>&1; then
    echo 'Error: asdf is not installed.'
    exit 1
  fi
}

function exists_python() {
  if command -v python > /dev/null 2>&1; then
    echo 'Python is already installed.'
    exit 0
  fi
}

function install_python() {
  python_version='3.11.9'
  asdf plugin-add python
  asdf install python ${python_version}
  asdf global python ${python_version}
}

function main() {
  exists_asdf
  exists_python
  install_python

  exit 0
}

# Call the main function only if the script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi
