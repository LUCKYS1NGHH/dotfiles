#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

SELECTED=$(find "$WALLPAPER_DIR" -type f ! -name ".*" \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) \
  | while read -r img; do
      echo -en "$(basename "${img%.*}")\0icon\x1f$img\n"
    done \
  | rofi -dmenu -p "Wallpaper" -show-icons -theme "$HOME/.config/rofi/wallpaper-changer/theme.rasi")

# Reconstruct full path from selected name
FULL_PATH=$(find "$WALLPAPER_DIR" -type f ! -name ".*" \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) \
  | grep -F "/${SELECTED}.")

[ -z "$FULL_PATH" ] && exit 1

awww img "$FULL_PATH" --transition-type random --transition-duration 2.5

base=$(basename "$FULL_PATH")

sed -i 's|path = ~/Pictures/wallpapers/.*|path = ~/Pictures/wallpapers/'"$base"'|' ~/.config/hypr/hyprlock.conf
