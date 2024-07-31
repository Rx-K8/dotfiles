#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
This shell script is designed to install Node.js using the asdf tool.

USAGE:
  chmod +x install_nodejs.sh
  ./install_nodejs.sh

DESCRIPTION:
  - Checks if asdf is installed. If not, it displays an error message and exits.
  - Checks if Node.js is already installed. If it is, it displays a message and exits.
  - Installs the latest version of Node.js using asdf and sets it globally.

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

function exists_nodejs() {
  if command -v node > /dev/null 2>&1; then
    echo 'Nodejs is already installed.'
    exit 0
  fi
}

function install_nodejs() {
  nodejs_version='latest'
  asdf plugin-add nodejs
  asdf install nodejs ${nodejs_version}
  asdf global nodejs ${nodejs_version}
}

function main() {
  exists_asdf
  exists_java
  install_java

  exit 0
}

# Call the main function only if the script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi
