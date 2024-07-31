#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
This shell script is designed to install Java using the asdf tool.

USAGE:
  chmod +x install_java.sh
  ./install_java.sh

DESCRIPTION:
  - Checks if asdf is installed. If not, it displays an error message and exits.
  - Checks if java is already installed. If it is, it displays a message and exits.
  - Installs java using asdf and sets it globally.

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

function exists_java() {
  if command -v java > /dev/null 2>&1; then
    echo 'Java is already installed.'
    exit 0
  fi
}

function install_java() {
  java_version='oracle-21.0.2'
  asdf plugin-add java https://github.com/halcyon/asdf-java.git
  asdf install java ${java_version}
  asdf global java ${java_version}
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
