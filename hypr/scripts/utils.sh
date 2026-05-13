#!/bin/bash

choice=$(echo -e " Chrome\n Zoom\n Stremio\n  Wifi\n Menu para apagar\n󰻡  Anki" \
    | wofi --dmenu --style ~/.config/wofi/style.css --prompt '')

case "$choice" in
    " Chrome") google-chrome-stable ;;
    " Zoom") zoom ;;
    " Stremio") flatpak run com.stremio.Stremio ;;
    "  Wifi") bash ~/wofi-network-manager/wofi-network-manager.sh ;;
    "󰻡  Anki") anki ;;
    " Menu para apagar") ~/.config/hypr/scripts/powermenu.sh ;;
esac
