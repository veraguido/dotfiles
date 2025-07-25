#!/usr/bin/env bash
# Dependencies: bash>=3.2, coreutils, file, xfce4-session

icon_symbol=""
# Uncomment the below and comment out the above if you prefer the apple logo instead
#readonly ICON="${DIR}/icons/power/apple.png"

# Panel
INFO="<txt>$icon_symbol</txt>"
INFO+="<txtclick>xfce4-session-logout</txtclick>"

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="Power Management"
MORE_INFO+="</tool>"

# Panel Print
echo -e "${INFO}"

# Tooltip Print
echo -e "${MORE_INFO}"
