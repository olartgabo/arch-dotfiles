#!/bin/sh
# Toggle the kitty quick-access terminal (quake-style dropdown).

if pgrep -f -- "kitten panel --toggle-visibility" >/dev/null 2>&1; then
    pkill -f -- "kitten panel --toggle-visibility"
else
    kitten quick_access_terminal --detach
fi
