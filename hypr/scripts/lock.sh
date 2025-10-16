#!/usr/bin/bash

is_dpms=`hyprctl monitors -j | jq -r '.[0].dpmsStatus'`

if [ "$is_dpms" == "true" ]; then
    hyprctl dispatch exec hyprlock
    hyprctl dispatch dpms off
else
    hyprctl dispatch dpms on
fi
