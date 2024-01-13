#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Run Neovim for the first time.
if Neovim is already exists, it ends with an error "1".
Otherwise, it exits with normal "0".

作成: 2024/01/13: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
set -eu

# If Neovim exists, it ends error "1".
if [ -z $(which nvim) ]; then
  echo 'Neovim already is existed.' 1>&2
  exit 1
fi

bash ./install.sh
bash ./symbolic-link.sh

exit 0
