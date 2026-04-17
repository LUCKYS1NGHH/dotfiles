#!/usr/bin/env bash

dir="$HOME/.config/rofi/cliphist"
theme='theme'

## Run
rofi -modi clipboard:$dir/cliphist-img.sh -show clipboard -theme ${dir}/${theme}.rasi
