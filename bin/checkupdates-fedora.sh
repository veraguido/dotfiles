#!/bin/bash

# Check for updates and count the number of packages to be updated
update_count=$(dnf check-update | grep -v "^$" | grep -v -E "Last metadata expiration check|^$" | wc -l)

# Output the number of packages to be updated
echo "<txt> Updates: $update_count </txt><txtclick>xfce4-terminal -x sudo dnf update --refresh</txtclick>"
