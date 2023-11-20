#!/bin/bash

execute_in_terminal() {
    local terminal_emulator=$1
    local command_to_execute=$2
    local command=""

    case $terminal_emulator in
        "gnome-terminal")
            command="$terminal_emulator --command=\"$command_to_execute\""
            ;;
        "konsole")
            command="$terminal_emulator --separate -e \"$command_to_execute\""
            ;;
        "xterm")
            command="$terminal_emulator -e \"$command_to_execute\""
            ;;
        "terminator")
            command="$terminal_emulator -e \"$command_to_execute\""
            ;;
        "tilix")
            command="$terminal_emulator -e \"$command_to_execute\""
            ;;
        "alacritty")
            command="$terminal_emulator -e sh -c \"$command_to_execute\""
            ;;
        "urxvt")
            command="$terminal_emulator -e sh -c \"$command_to_execute\""
            ;;
        "lxterminal")
            command="$terminal_emulator --command=\"$command_to_execute\""
            ;;
        "mate-terminal")
            command="$terminal_emulator --command=\"$command_to_execute\""
            ;;
        "terminology")
            command="$terminal_emulator -e \"$command_to_execute\""
            ;;
        "xterm")
            command="$terminal_emulator -e \"$command_to_execute\""
            ;;
        "tilda")
            command="$terminal_emulator -e \"$command_to_execute\""
            ;;
        "guake")
            command="$terminal_emulator -e \"$command_to_execute\""
            ;;
        "kitty")
            command="$terminal_emulator -e \"$command_to_execute\""
            ;;
        "yakuake")
            command="$terminal_emulator -e \"$command_to_execute\""
            ;;
        "tmux")
            command="$terminal_emulator new-session -d -n mysession \"$command_to_execute\" \\; attach-session -t mysession"
            ;;
        "terminator")
            command="$terminal_emulator -e \"$command_to_execute\""
            ;;
        "termite")
            command="$terminal_emulator -e sh -c \"$command_to_execute\""
            ;;
        "hyper")
            command="$terminal_emulator -e \"$command_to_execute\""
            ;;
        "xfce4-terminal")
            command="$terminal_emulator --command=\"$command_to_execute\""
            ;;
        *)
            echo "Unsupported terminal emulator: $terminal_emulator"
            exit 1
            ;;
    esac

    eval "$command"
}
