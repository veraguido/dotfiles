#!/bin/bash

# Update the package list and count the number of packages due for upgrade
state=$(xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -v)

enabled_icon=""
disabled_icon=""

visibility_icon=$enabled_icon

if [ $state = false ]; then
    visibility_icon=$disabled_icon
fi
# Output the number of packages due for upgrade in a simple format
echo "<txt>$visibility_icon</txt><txtclick>xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -T</txtclick>"
#echo "<tool>Presentation mode is: sarasa</tool>"