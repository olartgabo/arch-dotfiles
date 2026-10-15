#!/usr/bin/env bash
# Launcher for hyprquickpaper (43PR dotfiles wallpaper selector).
# Its file model is non-recursive, so keep a flat symlink view of
# ~/Pictures/Wallpapers (theme folders flattened with __-prefixed names)
# in sync before launching.
WALL_DIR="$HOME/Pictures/Wallpapers"
FLAT="$WALL_DIR/.picker"

mkdir -p "$FLAT"
find "$FLAT" -xtype l -delete

find "$WALL_DIR" -mindepth 2 -type f \( \
    -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \
\) ! -path "*/.picker/*" | while read -r img; do
    rel="${img#"$WALL_DIR"/}"
    name="${rel%.*}"
    ext="${rel##*.}"
    ln -sfn "$img" "$FLAT/${name//\//__}.$ext"
done

exec quickshell -c hyprquickpaper
