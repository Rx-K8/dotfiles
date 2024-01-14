#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Setup Linux.

If this os isn't inux, returns error "1".

Date Created: 2024/01/14: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

# Make sure os
if [ "$(uname)" != 'Linux' ]; then
  echo 'This script can only be executed on Linux' 1>&2
  exit 1
fi

bash ./apt/install-apt-packages.sh
bash ./asdf/install-asdf.sh
bash ./asdf/install-python.sh
bash ./asdf/install-nodejs.sh
bash ./neovim/setup.sh

exit 0
