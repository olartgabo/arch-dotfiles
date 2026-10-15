#!/bin/bash
PRIMARY="eDP-1"

externals=$(niri msg outputs 2>/dev/null | sed -n 's/.*(\(.*\))/\1/p' | grep -v "^${PRIMARY}$")
if [ -z "$externals" ]; then
    notify-send "Display Switch" "No external display connected"
    exit 0
fi

EXT=$(echo "$externals" | head -n1)

CHOICE=$(echo -e "Extend\nLaptop only\nExternal only" | rofi -dmenu -p "󰍹 Display" -lines 3 -theme-str 'window {width: 360px; height: 260px;}' 2>/dev/null)

case "$CHOICE" in
    "Extend")
        niri msg output "$EXT" on
        niri msg output "$PRIMARY" on
        niri msg output "$EXT" position right-of "$PRIMARY"
        notify-send "Display Switch" "Extended to $EXT"
        ;;
    "Laptop only")
        niri msg output "$EXT" off
        niri msg output "$PRIMARY" on
        notify-send "Display Switch" "Laptop only"
        ;;
    "External only")
        niri msg output "$PRIMARY" off
        niri msg output "$EXT" on
        notify-send "Display Switch" "External only ($EXT)"
        ;;
esac
