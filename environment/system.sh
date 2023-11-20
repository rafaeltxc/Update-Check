#!/bin/bash

# Get variables
declare distro=${Distro[$(lsb_release -si)]}

declare pkg_manager=$(echo $distro | jq -r '.package_manager')
declare update_command=$(echo $distro | jq -r '.update_command')
declare terminal=$(echo $TERM)

# Check if terminal is valid
declare isTerminal=false

if command -v "$terminal" &> /dev/null; then
    isTerminal=true
else
    while [ "$isTerminal" = false ]; do
        read -p "Error: Terminal could not be found, please specify a new one (type: \"exit\" to leave the process): " terminal
        if command -v "$terminal" &> /dev/null; then
            isTerminal=true
        fi
    done
fi

# Export variables
export PKG_MG="$pkg_manager"
export UPDATE_CMD="$update_command"
export DF_TERMINAL="$terminal"
