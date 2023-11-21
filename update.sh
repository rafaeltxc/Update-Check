#!/bin/bash

# Gets file directory and source needed script.
declare file_dir="$(dirname "$(realpath "$BASH_SOURCE")")"
source $file_dir/terminal.sh

# Start update.
echo "$DF_TERMINAL"
execute_in_terminal "$DF_TERMINAL" "sudo $PKG_MG $UPDATE_CMD"
