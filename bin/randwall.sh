#!/bin/bash
echo $DISPLAY
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
wallpaper_path="/home/guido/MEGA/MEGAsync/wallpapers"

if [ -z "$1" ]; then
	swww img $(find $wallpaper_path -type f | shuf -n 1)
	exit 1
fi

if [ $1 = "random" ]; then
	swww img $(find $wallpaper_path -type f | shuf -n 1) --transition-type any --transition-fps 60 --transition-pos 1,1
fi
