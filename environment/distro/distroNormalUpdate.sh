#!/bin/bash

# Json like sctructure with distros names and they respective package manager, with their method of system updating.
declare -A Distro=(
    ["Alpine"]='{ "package_manager": "apk", "update_command": "update && upgrade" }'
    ["Antergos"]='{ "package_manager": "pacman", "update_command": "-Syu" }'
    ["Arch"]='{ "package_manager": "pacman", "update_command": "-Syu" }'
    ["CentOS"]='{ "package_manager": "yum", "update_command": "update && upgrade" }'
    ["Debian"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["elementary OS"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["Fedora"]='{ "package_manager": "dnf", "update_command": "update && upgrade" }'
    ["Gentoo"]='{ "package_manager": "emerge", "update_command": "--sync && --update --deep --with-bdeps=y @world" }'
    ["Kali Linux"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["Manjaro"]='{ "package_manager": "pacman", "update_command": "-Syu" }'
    ["Mint"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["MX Linux"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["openSUSE"]='{ "package_manager": "zypper", "update_command": "update && upgrade" }'
    ["RHEL"]='{ "package_manager": "yum", "update_command": "update && upgrade" }'
    ["Slackware"]='{ "package_manager": "slackpkg", "update_command": "update && upgrade" }'
    ["Solus"]='{ "package_manager": "eopkg", "update_command": "update && upgrade" }'
    ["Ubuntu"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["Ubuntu Studio"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
    ["Void Linux"]='{ "package_manager": "xbps-install", "update_command": "update && upgrade" }'
    ["Zorin OS"]='{ "package_manager": "apt", "update_command": "update && upgrade" }'
)
