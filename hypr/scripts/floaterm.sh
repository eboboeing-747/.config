#!/usr/bin/bash

hyprctl dispatch exec [float] kitty
hyprctl dispatch resizeactive exact 60% 60%
hyprctl dispatch centerwindow
