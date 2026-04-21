#!/bin/bash
WALLDIR="$HOME/Pictures/wallpapers"

awww img "$(find "$WALLDIR" -type f ! -name '.*' | shuf -n 1)" --transition-type center
