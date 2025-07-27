#!/bin/bash

# Update the package list and count the number of packages due for upgrade
upgrade_count=$(dnf check-update --refresh -q | grep -v "^$" | wc -l)

# Output the number of packages due for upgrade in a simple format
echo "<txt>$upgrade_count</txt><txtclick>exo-open --launch TerminalEmulator sudo dnf update --refresh</txtclick>"
