#!/bin/bash

# Detect leader key dynamically from .tmux.conf
PREFIX_RAW=$(grep '^set -g prefix' ~/.tmux.conf 2>/dev/null | awk '{print $NF}')
PREFIX_RAW="${PREFIX_RAW:-C-b}"

# Convert tmux notation to display format: C-b → Ctrl+b, M-f → Alt+f, etc.
PREFIX_DISPLAY=$(echo "$PREFIX_RAW" | sed 's/^C-/Ctrl+/' | sed 's/^M-/Alt+/' | sed 's/^S-/Shift+/')

WOFI_CMD="wofi --dmenu --style $HOME/.config/wofi/style.css"

display_entries=()
command_entries=()

add_entry() {
    local key="$1" desc="$2" cmd="$3"
    if [ -n "$key" ]; then
        display_entries+=("$(printf '%s %s\t%s' "$PREFIX_DISPLAY" "$key" "$desc")")
    else
        display_entries+=("$(printf '%s\t%s' "$PREFIX_DISPLAY" "$desc")")
    fi
    command_entries+=("$cmd")
}

show_menu() {
    local prompt="$1"
    local choice
    choice=$(printf '%s\n' "${display_entries[@]}" | $WOFI_CMD --prompt "$prompt")
    [ -z "$choice" ] && exit 0

    local i
    for i in "${!display_entries[@]}"; do
        if [ "${display_entries[$i]}" = "$choice" ]; then
            tmux ${command_entries[$i]}
            exit $?
        fi
    done
    exit 1
}

category=$(printf '%s\n' "Panes" "Session Control" "Window Control" "Copy Mode" "Misc" \
    | $WOFI_CMD --prompt 'Tmux cheatsheet')

[ -z "$category" ] && exit 0

case "$category" in
    "Panes")
        Q='"'
        add_entry "$Q" "Split horizontally" "split-window -h"
        add_entry "%" "Split vertically"   "split-window -v"
        add_entry "z" "Zoom pane"          "resize-pane -Z"
        add_entry "x" "Close pane"         "kill-pane"
        add_entry "h" "Select pane left"   "select-pane -L"
        add_entry "j" "Select pane down"   "select-pane -D"
        add_entry "k" "Select pane up"     "select-pane -U"
        add_entry "l" "Select pane right"  "select-pane -R"
        add_entry "{" "Swap pane left"     "swap-pane -U"
        add_entry "}" "Swap pane right"    "swap-pane -D"
        add_entry "o" "Cycle panes"        "select-pane -t :.+"
        add_entry "M-h" "Resize pane left"  "resize-pane -L 5"
        add_entry "M-j" "Resize pane down"  "resize-pane -D 5"
        add_entry "M-k" "Resize pane up"    "resize-pane -U 5"
        add_entry "M-l" "Resize pane right" "resize-pane -R 5"
        show_menu "Panes"
        ;;
    "Session Control")
        add_entry "d" "Detach session"        "detach-client"
        add_entry "s" "Switch session (tree)" "choose-tree -Zs"
        add_entry '$' "Rename session"        'command-prompt -I "#S" -p "Rename session:" "rename-session -- %1"'
        add_entry "(" "Previous session"      "switch-client -p"
        add_entry ")" "Next session"          "switch-client -n"
        show_menu "Session Control"
        ;;
    "Window Control")
        add_entry "c" "Create window"      "new-window"
        add_entry "," "Rename window"      'command-prompt -I "#W" -p "Rename window:" "rename-window -- %1"'
        add_entry "&" "Close window"       "kill-window"
        add_entry "n" "Next window"        "next-window"
        add_entry "p" "Previous window"    "previous-window"
        for i in 0 1 2 3 4 5 6 7 8 9; do
            add_entry "$i" "Window $i"     "select-window -t :$i"
        done
        add_entry "w" "List windows"       "choose-tree -Zw"
        show_menu "Window Control"
        ;;
    "Copy Mode")
        add_entry "[" "Enter copy mode"    "copy-mode"
        add_entry "]" "Paste buffer"       "paste-buffer"
        add_entry "=" "List buffers"       "choose-buffer"
        add_entry "-" "Paste last buffer"  "paste-buffer"
        show_menu "Copy Mode"
        ;;
    "Misc")
        add_entry "" "Send prefix"         "send-prefix"
        add_entry "r" "Reload config"      "source-file ~/.tmux.conf"
        add_entry "t" "Clock mode"         "clock-mode"
        add_entry ":" "Command prompt"     "command-prompt"
        add_entry "?" "List keybindings"   "list-keys"
        show_menu "Misc"
        ;;
esac
