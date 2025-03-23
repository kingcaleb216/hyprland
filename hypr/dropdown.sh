#!/bin/bash
# ~/.config/hypr/toggle-kitty-dropdown.sh

if pgrep -f "kitty --class dropdown" > /dev/null; then
    pkill -f "kitty --class dropdown"
else
    kitty --class dropdown &
fi

