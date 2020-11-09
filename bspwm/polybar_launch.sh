#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar

my_laptop_internal_monitor=$(xrandr --query | grep 'eDP-1-1')
if [[ $my_laptop_internal_monitor = *connected* ]]; then
    polybar internal &
fi

my_laptop_external_monitor=$(xrandr --query | grep 'DP-0')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    polybar example &
fi

echo "Polybar launched..."
