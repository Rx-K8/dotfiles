#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Install java by asdf.

If asdf isn't installed, returns error "1".
if java is installed, returns error "1".
Date Created: 2024/01/14: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

JAVA_VERSION='oracle-21.0.2'

# make sure that asdf is already installed.
if [ -z $(which asdf) ]; then
  echo "asdf isn't installed." 1>&2
  exit 1
fi

# Make sure that python is already installed.
if [ $(which java) ]; then
  echo 'java is already instaled.' 1>&2
  exit 1
fi

# Download python
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java ${JAVA_VERSION}
asdf global java ${JAVA_VERSION}

exit 0
