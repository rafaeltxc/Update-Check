#!/bin/bash

declare file_dir="$(dirname "$(realpath "$BASH_SOURCE")")"
source $file_dir/terminal.sh

execute_in_terminal "$DF_TERMINAL" "sudo $PKG_MG $UPDATE_CMD"
