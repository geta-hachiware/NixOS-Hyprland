#!/usr/bin/env bash

CACHE_ROOT="$HOME/.cache/cached_imgs"
WALLPAPER_ROOT="$HOME/Pictures/wallpapers"
ROFI_THEME="$HOME/.geta/home/rofi/Wallpaperselect/rofi-wallpaper-sel.rasi"

mkdir -p "$CACHE_ROOT"

mapfile -t originPath < <(find ${WALLPAPER_ROOT} -maxdepth 1 -type f)
mapfile -t cachedPath < <(find ${CACHE_ROOT} -maxdepth 1 -type f)
declare -A bgresult
declare -A cachedresult

bgnames=()

function cacheImg {
    resolution=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 $1)
    width_=$(echo "${resolution}" | awk -F',' '{print $1}')
    height_=$(echo "${resolution}" | awk -F',' '{print $2}')
    if [ "${width_}" -lt "${height_}" ]
    then
        ffmpeg -i $1 -loglevel quiet -vf  "scale=600:-1, crop=600:600:0:(iw-600)/2" $2
    else
        ffmpeg -i $1 -loglevel quiet -vf  "scale=-1:600, crop=600:600:(iw-600)/2:0" $2
    fi
    echo $2
}

function getFileName {
    basename "$1" | sed 's/\.[^.]*$//'
}

# Execute command according the wallpaper manager
function executeCommand() {
  ln -sf "$1" "$HOME/.current_wallpaper"
}

for pathIDX in "${!originPath[@]}"; do
    filename=$(getFileName "${originPath[$pathIDX]}")
    bgresult["${filename}"]="${originPath[$pathIDX]}"
    bgnames[$pathIDX]+="${filename}"
done


for pathIDX in "${!cachedPath[@]}"; do
    filename=$(getFileName "${cachedPath[$pathIDX]}")
    cachedresult["${filename}"]="${cachedPath[$pathIDX]}"
done


for fName in "${bgnames[@]}"; do
    if [[ -v cachedresult[$fName] ]] 
    then
        :
    else
        cachedresult[$fName]=$(cacheImg "${bgresult[$fName]}" "${CACHE_ROOT}/${fName}.png")
    fi
done

strrr=""
for fName in "${bgnames[@]}"; do
    strrr+="$(echo -n "${fName}\0icon\x1f${cachedresult[$fName]}\n")"
done

selected=$(echo -en "${strrr}" | rofi -dmenu -config -theme "$ROFI_THEME" )
if [[ -n "$selected" && -f "${bgresult[$selected]}" ]]; then

  swww img "${bgresult[$selected]}" --transition-type wipe --transition-fps 60
  executeCommand "${bgresult[$selected]}"

  wal -i "${bgresult[$selected]}" -q
  wal -o "$HOME/.cache/wal/colors-hyprland.conf"
  wal -o "$HOME/.cache/wal/colors-kitty.conf"

  kitty @ set-colors --all --config $HOME/.cache/wal/colors-kitty.conf

  cp "$HOME/.cache/wal/colors-waybar.css" "$HOME/.config/waybar/style.css"
  cp "$HOME/.cache/wal/templates/colors-swaync.ccss" "$HOME/.config/swaync/style/colors-swaync.css"
  
  pkill waybar && waybar &
  swaync-client -rs

fi
hyprctl reload
