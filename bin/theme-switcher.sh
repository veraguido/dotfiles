#!/bin/bash

source ${HOME}/repos/dotfiles/bin/libs/change-theme.sh

# Check current theme
CURRENT_THEME=$(xfconf-query -c xsettings -p /Net/ThemeName)

# Toggle theme
if [ "$CURRENT_THEME" = "$DARK_THEME" ]; then
    set_light_theme
else
    set_dark_theme
fi