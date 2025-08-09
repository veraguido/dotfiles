#!/bin/bash

#!/bin/bash
SERVICE="python"
icon_text="󰝘"
if pgrep -x "$SERVICE" >/dev/null
then
    icon_text="󰝘"
    command_to_run=
else
    icon_text="󰉧"
fi



# Output the number of packages due for upgrade in a simple format
echo "<txt>$icon_text</txt><txtclick>bash ${HOME}/repos/dotfiles/bin/toggle-xpytile.sh</txtclick>"
echo "<tool>toggle auto tiling</tool>"
