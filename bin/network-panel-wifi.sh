#!/bin/bash

# Define the WiFi interface name
WIFI_INTERFACE="wlp11s0"
icon_text="󰤟"
# Function to check WiFi status and signal strength
check_wifi() {
    if nmcli radio wifi | grep -q "enabled"; then
        if iwconfig $WIFI_INTERFACE | grep -q "Not-Associated"; then
            icon_text="<txt>󰤮</txt>"
            echo "<tool>WiFi is disconnected</tool>"
        else
            # Get the signal strength
            SIGNAL_STRENGTH=$(nmcli -t -f ACTIVE,SSID,SIGNAL device wifi list | awk -F':' '$1 ~ /yes/ {print ""$3}')
            if [ -z "$SIGNAL_STRENGTH" ]; then
                icon_text="<txt>󰤯</txt>"
                echo "<tool>No signal strength information</tool>"
            else
                if [ "$SIGNAL_STRENGTH" -ge 90 ]; then
                    icon_text="<txt>󰤨</txt>"
                    icon_text="<tool>WiFi signal strength: Superb ($SIGNAL_STRENGTH%)</tool>"
                elif [ "$SIGNAL_STRENGTH" -ge 75 ]; then
                    icon_text="<txt>󰤥</txt>"
                    echo "<tool>WiFi signal strength: Excellent ($SIGNAL_STRENGTH%)</tool>"
                elif [ "$SIGNAL_STRENGTH" -ge 50 ]; then
                    icon_text="<txt>󰤢</txt>"
                    echo "<tool>WiFi signal strength: Good ($SIGNAL_STRENGTH%)</tool>"
                elif [ "$SIGNAL_STRENGTH" -ge 25 ]; then
                    icon_text="<txt>󰤟</txt>"
                    echo "<tool>WiFi signal strength: Fair ($SIGNAL_STRENGTH%)</tool>"
                else
                    icon_text="<img>/path/to/weak_signal_icon.png</img>"
                    echo "<tool>WiFi signal strength: Weak ($SIGNAL_STRENGTH%)</tool>"
                fi
            fi
        fi
    else
        icon_text="<txt>󰤯</txt>"
        echo "<tool>WiFi is disabled</tool>"
    fi
    echo "$icon_text <txtclick>exo-open --launch TerminalEmulator nmtui</txtclick>"
}

# Run the check_wifi function
check_wifi