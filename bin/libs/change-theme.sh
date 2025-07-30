#!/bin/bash

# Define your themes and icons
DARK_THEME="WhiteSur-Dark-solid"
LIGHT_THEME="WhiteSur-Light-solid"
DARK_ICONS="Flat-Remix-Blue-Dark"
LIGHT_ICONS="Flat-Remix-Blue-Light"

# Function to set dark theme
set_dark_theme() {
    xfconf-query -c xsettings -p /Net/ThemeName -s "$DARK_THEME"
    xfconf-query -c xsettings -p /Net/IconThemeName -s "$DARK_ICONS"
    xfconf-query -c xfce4-panel -p /panels/dark-mode -s true
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    xfconf-query -c xfwm4 -p /general/theme -s onepx   
}

# Function to set light theme
set_light_theme() {
    xfconf-query -c xsettings -p /Net/ThemeName -s "$LIGHT_THEME"
    xfconf-query -c xsettings -p /Net/IconThemeName -s "$LIGHT_ICONS"
    xfconf-query -c xfce4-panel -p /panels/dark-mode -s false
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    xfconf-query -c xfwm4 -p /general/theme -s onepx-light
}