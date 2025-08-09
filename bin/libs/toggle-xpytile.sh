#!/bin/bash

SERVICE="python"
#pid=pidof python
#echo $SERVICE
echo $pid
if pgrep -x "$SERVICE" >/dev/null
then
    kill $pid
else
    bash ${HOME}/repos/dotfiles/bin/libs/toggle-xpytile.sh
fi
