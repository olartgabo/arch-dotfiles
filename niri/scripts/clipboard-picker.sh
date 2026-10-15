#!/bin/sh

selection="$(cliphist list | rofi -dmenu -i -p Clipboard)"

[ -n "$selection" ] && printf '%s' "$selection" | cliphist decode | wl-copy
