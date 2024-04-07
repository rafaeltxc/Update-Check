#!/bin/bash

# Json like sctructure with distros names and they respective package manager, with their method of system updating.
declare -A Distro=(
    ["Alpine"]='{ "package_manager": "apk", "update_command": "update && upgrade" }'
    ["Antergos"]='{ "package_manager": "pacman", "update_command": "-Syu" }'
    ["Arch"]='{ "package_manager": "pacman", "update_command": "-Syu" }'
    ["CentOS"]='{ "package_manager": "yum", "update_command": "update" }'
    ["Debian"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["Elementary"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["Endeavor"]='{ "package_manager": "pacman", "update_command": "-Syu" }'
    ["Fedora"]='{ "package_manager": "dnf", "update_command": "update" }'
    ["Gentoo"]='{ "package_manager": "emerge", "update_command": "--sync && --update && --deep && --newuse @world" }'
    ["Kali"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["Mageia"]='{ "package_manager": "urpmi", "update_command": "--update --auto-select" }'
    ["Manjaro"]='{ "package_manager": "pacman", "update_command": "-Syu" }'
    ["Mint"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["Peppermint"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["Red Hat Enterprise Linux (RHEL)"]='{ "package_manager": "yum", "update_command": "update" }'
    ["Solus"]='{ "package_manager": "eopkg", "update_command": "upgrade" }'
    ["openSUSE"]='{ "package_manager": "zypper", "update_command": "update && upgrade" }'
    ["Ubuntu"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["Void"]='{ "package_manager": "xbps-install", "update_command": "update && upgrade" }'
    ["Zorin"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
)
