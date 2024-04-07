#!/bin/bash

# Assert correct terminal syntax.
#
# param terminal_emulator Receives given terminal.
# param command_to_execute Receives command to be executed.
# return Command execution of the update command in a new terminal.
execute_in_terminal() {
    local terminal_emulator=$1
    local command_to_execute=$2
    local command=""

    case $terminal_emulator in
        "gnome-terminal")
            command="$terminal_emulator -- bash -c '$command_to_execute'"
            ;;
        "konsole")
            command="$terminal_emulator --hold -e bash -c '$command_to_execute'"
            ;;
        "xterm" | "rxvt" | "xfce4-terminal")
            command="$terminal_emulator -e bash -c '$command_to_execute'"
            ;;
        "terminator" | "tilda" | "terminology" | "terminix" | "termite" | "kitty" | "yakuake" | "guake" | "alacritty" | "tilix")
            command="$terminal_emulator -e bash -ic '$command_to_execute'"
            ;;
        "lxterminal")
            command="$terminal_emulator -e /bin/bash -c '$command_to_execute'"
            ;;
        "mate-terminal")
            command="$terminal_emulator --window --title='Executed Command' --command='$command_to_execute'"
            ;;
        *)
            echo "Unsupported terminal emulator: $terminal_emulator"
            exit 1
            ;;
    esac

    eval "$command"
}
