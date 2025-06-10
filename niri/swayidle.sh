#!/bin/sh
swayidle -w timeout 300 'swaylock -f -i ~/MEGA/MEGAsync/wallpapers/1357324.jpeg' timeout 500 'niri msg action power-off-monitors' timeout 600 'systemctl suspend' before-sleep 'swaylock -f -i ~/MEGA/MEGAsync/wallpapers/1357324.jpeg'
