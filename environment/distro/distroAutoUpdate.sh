#!/bin/bash

# Json like sctructure with distros names and they respective package manager, with their method of system updating skipping secutiry questions.
declare -A Distro=(
    ["Alpine"]='{ "package_manager": "apk", "update_command": "update && upgrade --no-cache" }'
    ["Arch"]='{ "package_manager": "pacman", "update_command": "-Syu --noconfirm" }'
    ["ArchBang"]='{ "package_manager": "pacman", "update_command": "-Syu --noconfirm" }'
    ["CentOS"]='{ "package_manager": "yum", "update_command": "update -y" }'
    ["Debian"]='{ "package_manager": "apt", "update_command": "update && upgrade -y" }'
    ["Fedora"]='{ "package_manager": "dnf", "update_command": "update -y" }'
    ["Fedora Silverblue"]='{ "package_manager": "rpm-ostree", "update_command": "upgrade" }'
    ["Gentoo"]='{ "package_manager": "emerge", "update_command": "--sync && --update --deep --with-bdeps=y @world" }'
    ["Kali Linux"]='{ "package_manager": "apt", "update_command": "update && dist-upgrade -y" }'
    ["Linux Mint"]='{ "package_manager": "apt", "update_command": "update && upgrade -y" }'
    ["Mageia"]='{ "package_manager": "dnf", "update_command": "update -y" }'
    ["Manjaro"]='{ "package_manager": "pacman", "update_command": "-Syu --noconfirm" }'
    ["openSUSE"]='{ "package_manager": "zypper", "update_command": "update --non-interactive" }'
    ["Pop!_OS"]='{ "package_manager": "apt", "update_command": "update && upgrade -y" }'
    ["Red Hat Enterprise Linux (RHEL)"]='{ "package_manager": "yum", "update_command": "update -y" }'
    ["Slackware"]='{ "package_manager": "slackpkg", "update_command": "update && upgrade-all" }'
    ["Solus"]='{ "package_manager": "eopkg", "update_command": "up -y" }'
    ["Ubuntu"]='{ "package_manager": "apt", "update_command": "update && upgrade -y" }'
    ["Void Linux"]='{ "package_manager": "xbps-install", "update_command": "-Su --yes" }'
    ["Zorin OS"]='{ "package_manager": "apt", "update_command": "update && upgrade -y" }'
)
