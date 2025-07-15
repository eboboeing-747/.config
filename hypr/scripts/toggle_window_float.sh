#!/usr/bin/bash

is_float=`hyprctl activewindow -j | jq -r '.floating'`

if [ "$is_float" == "true" ]; then
    hyprctl dispatch togglefloating
else
    hyprctl dispatch togglefloating
    hyprctl dispatch resizeactive exact 60% 60%
    hyprctl dispatch centerwindow
fi
