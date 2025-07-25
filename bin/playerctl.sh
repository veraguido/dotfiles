#!/bin/bash

# Update the package list and count the number of packages due for upgrade
player_title_album=$(playerctl metadata --all-players --format '{{status}}{{ artist }} - {{ title }}' | grep Playing | cut -c 8-)
player_name=$(playerctl metadata --all-players --format '{{status}}{{playerName}}' | grep Playing | cut -c 8-)
player_status=$(playerctl --player=$player_name status)
players_running=$(playerctl -l | wc -l)
icon_name=""

if [[ -z $player_name ]]; then
    player_name=$(playerctl metadata --all-players --format '{{playerName}}' | head -n 1)
    player_title_album=$(playerctl metadata --player=$player_name --format '{{ artist }} - {{ title }}')
    icon_name=""
fi

icon_path="/home/guido/Pictures/icons/playpause.png"

if [ $player_status = "Playing" ]; then 
    icon_path="/home/guido/Pictures/icons/pause.png"
fi


# Output the number of packages due for upgrade in a simple format
echo "<txt>$icon_name  $player_title_album</txt><txtclick>playerctl --player=$player_name play-pause</txtclick>"
