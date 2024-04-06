#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Install nodejs by asdf.

If asdf isn't installed, returns error "1".
if nodejs is installed, returns error "1".
Date Created: 2024/01/14: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

# make sure that asdf is already installed.
if [ -z $(which asdf) ]; then
  echo "asdf isn't installed." 1>&2
  exit 1
fi

# Make sure that nodejs is already installed.
if [ $(which nodejs) ]; then
  echo 'nodejs is already instaled.' 1>&2
  exit 1
fi

# Download nodejs
asdf plugin-add nodejs
asdf install nodejs latest
asdf global nodejs latest

exit 0
