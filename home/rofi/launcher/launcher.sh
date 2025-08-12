#!/usr/bin/env bash

## Rofi   : Launcher
dir="$HOME/.config/rofi/launcher"
theme='rofi-launcher-config'

# Flatpak
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/export/share:/home/${USER}./local/share/flatpak/exports/share"
## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
