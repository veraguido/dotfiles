#!/bin/bash
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
notify-send "updates:" "$(checkupdates --nocolor)"
