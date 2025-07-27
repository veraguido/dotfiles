#!/bin/bash

# Define icons
DEFAULT_BLUETOOTH_ICON="󰂯"
ICON_BLUETOOTH_OFF="󰂲"
ICON_BLUETOOTH_ON="󰂯"
ICON_BLUETOOTH_HEADPHONES="󰥰"
ICON_BLUETOOTH_KEYBOARD="󰂯"
ICON_BLUETOOTH_MOUSE="󰦋"
ICON_BLUETOOTH_MULTIPLE="󰂱"

# Check if Bluetooth is powered on
bluetooth_status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

if [ "$bluetooth_status" = "no" ]; then
    echo "<txt>$ICON_BLUETOOTH_OFF</txt>"
    echo "<tool>Bluetooth is off</tool>"
    exit
fi

# Check connected devices
devices=$(bluetoothctl devices | awk '{print $2}')
connected_devices_count=0
device_types=()

for device in $devices; do
    connected=$(bluetoothctl info "$device" | grep "Connected: yes")
    if [ -n "$connected" ]; then
        connected_devices_count=$((connected_devices_count + 1))
        device_type=$(bluetoothctl info "$device" | grep "Icon" | awk '{print $2}')
        device_types+=("$device_type")
    fi
done

if [ "$connected_devices_count" -eq 0 ]; then
    echo "<txt>$ICON_BLUETOOTH_ON</txt>"
    echo "<txtclick>blueman-manager</txtclick>"
    echo "<tool>Bluetooth is on, no devices connected</tool>"
    exit
fi

# Determine the icon and tooltip based on the connected devices
if [ "$connected_devices_count" -gt 1 ]; then
    echo "<txt>$ICON_BLUETOOTH_MULTIPLE</txt>"
    echo "<tool>Multiple Bluetooth devices connected</tool>"
else
    case "${device_types[0]}" in
        "audio-headphones"|"audio-headset")
            echo "<txt>$ICON_BLUETOOTH_HEADPHONES</txt>"
            echo "<tool>Bluetooth headphones connected</tool>"
            ;;
        "input-keyboard")
            echo "<txt>$ICON_BLUETOOTH_KEYBOARD</txt>"
            echo "<tool>Bluetooth keyboard connected</tool>"
            ;;
        "input-mouse")
            echo "<txt>$ICON_BLUETOOTH_MOUSE</txt>"
            echo "<tool>Bluetooth mouse connected</tool>"
            ;;
        *)
            echo "<txt>$ICON_BLUETOOTH_ON</txt>"
            echo "<tool>Bluetooth is on, unknown device connected</tool>"
            ;;
    esac
fi
