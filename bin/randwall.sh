#!/bin/bash
wallpaper_path="/home/guido/MEGA/MEGAsync/wallpapers"
swww img `find $wallpaper_path -type f | shuf -n 1` --transition-type any --transition-fps 60 --transition-pos 1,1