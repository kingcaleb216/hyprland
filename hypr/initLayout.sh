#!/bin/bash

function dashboard()
{
   workspace=$1

   hyprctl dispatch workspace $workspace
   sleep 0.2
   
   kitty --title "${workspace}_FETCH_TERM" -e bash -i -c "fetch; exec bash" &
   sleep 0.3
   
   hyprctl dispatch split:down
   kitty --title DWIGHT_TERM -e bash -i -c "dwight; exec bash" &
   sleep 0.3
   
   hyprctl dispatch focuswindow "title:^(${workspace}_FETCH_TERM)$"
   sleep 0.2
   
   hyprctl dispatch movewindow l
   hyprctl dispatch split:left
   kitty --title BTOP_TERM -e btop &
   sleep 0.5
}

# If dashboard flag is set
if [[ $1 == -d ]]
then
   # Reset current workspace to dashboard
   ~/.config/hypr/clearWorkspace.sh
   dashboard $(hyprctl activeworkspace -j | jq -r '.id')
else
   # Workspace 1 setup
   dashboard 1
   
   # Workspace 2 setup
   hyprctl dispatch workspace 2
   brave
fi

