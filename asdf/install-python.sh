
#!/bin/bash
# -*- coding: utf-8 -*-

: <<EOF_COMMENT
-----------------------------------------------------------
Install python by asdf.

If asdf isn't installed, returns error "1".
if python is installed, returns error "1".
Date Created: 2024/01/14: FUKUOKA Keito
-----------------------------------------------------------
EOF_COMMENT

# -e: Interrupts the script when an error occurs.
# -u: Error on undefined variables
# -o pipefail: Script is interrupted when an error in the middle of pipe-combined command.
set -euo pipefail

python_version='3.10.13'

# make sure that asdf is already installed.
if [ -z $(which asdf) ]; then
  echo "asdf isn't installed." 1>&2
  exit 1
fi

# Make sure that python is already installed.
if [ $(which python) ]; then
  echo 'python is already instaled.' 1>&2
  exit 1
fi

# Download python
asdf plugin-add python
asdf install python ${python_version}
asdf global python ${python_version}

exit 0
