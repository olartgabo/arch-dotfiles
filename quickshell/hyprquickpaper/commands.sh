# Resolve the .picker symlink to the real Theme/Variation/file path so
# theme-sync.sh can detect the palette from the directory structure.
target=$(realpath -- "$1")
awww img "$target" -t random --transition-duration 1
"$HOME/.config/scripts/theme-sync.sh" "$target"
