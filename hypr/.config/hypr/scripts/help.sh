#!/bin/bash

choice=$(echo -e " Chrome\n Zoom\n Stremio\n Menu para apagar\n󰻡  Anki\n  Archivos" \
    | wofi --dmenu --style ~/.config/wofi/style.css --prompt '')

case "$choice" in
    " Chrome") google-chrome-stable ;;
    " Zoom") zoom ;;
    " Stremio") flatpak run com.stremio.Stremio ;;
    "󰻡  Anki") anki ;;
    "  Archivos") dolphin ;;
    " Menu para apagar") ~/.config/hypr/scripts/powermenu.sh ;;
esac
