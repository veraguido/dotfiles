#!/bin/bash

# Define your themes and icons
DARK_THEME="Adwaita-dark"
LIGHT_THEME="Adwaita"
DARK_ICONS="Flat-Remix-Blue-Dark"
LIGHT_ICONS="Flat-Remix-Blue-Light"

# Function to set dark theme
set_dark_theme() {
    xfconf-query -c xsettings -p /Net/ThemeName -s "$DARK_THEME"
    xfconf-query -c xsettings -p /Net/IconThemeName -s "$DARK_ICONS"
}

# Function to set light theme
set_light_theme() {
    xfconf-query -c xsettings -p /Net/ThemeName -s "$LIGHT_THEME"
    xfconf-query -c xsettings -p /Net/IconThemeName -s "$LIGHT_ICONS"
}

# Check current theme
CURRENT_THEME=$(xfconf-query -c xsettings -p /Net/ThemeName)

# Get current hour and minute
CURRENT_HOUR=$(date +%H)
CURRENT_MINUTE=$(date +%M)

# Convert current time to total minutes since midnight
CURRENT_TIME=$((10#$CURRENT_HOUR * 60 + 10#$CURRENT_MINUTE))

# Define time ranges in minutes since midnight
MORNING_START=$((7 * 60))  # 7:00 AM
MORNING_END=$((12 * 60))   # 12:00 PM

# Check if current time is within the morning range
if [ "$CURRENT_TIME" -ge "$MORNING_START" ] && [ "$CURRENT_TIME" -lt "$MORNING_END" ]; then
    set_light_theme
else
    set_dark_theme
fi