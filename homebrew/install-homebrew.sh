#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Install homebrew.

If homebrew is already installed, returns error "1".
If this os isn't macos, returns error "1".

Date Created: 2024/01/14: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

# Make sure that asdf is already installed.
if [ $(which brew) ]; then
  echo 'brew is already installed.' 1>&2
  exit 1
fi

# Make sure os
if [ "$(uname)" != 'Darwin' ]; then
  echo 'This script can only be executed on macOS' 1>&2
  exit 1
fi

# Download homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

exit 0
