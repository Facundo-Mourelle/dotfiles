#!/bin/bash

choice=$(echo -e " Apagar\n Reiniciar\n Suspender\n Cerrar sesión" \
    | wofi --dmenu --style ~/.config/wofi/style.css --prompt '')

case "$choice" in
    " Apagar") systemctl poweroff ;;
    " Reiniciar") systemctl reboot ;;
    " Suspender") systemctl suspend ;;
    " Cerrar sesión") hyprctl dispatch exit ;;
esac

