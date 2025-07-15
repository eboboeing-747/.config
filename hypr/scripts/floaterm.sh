#!/usr/bin/bash

hyprctl dispatch exec kitty
hyprctl dispatch togglefloating
hyprctl dispatch resizeactive exact 60% 60%
hyprctl dispatch centerwindow
