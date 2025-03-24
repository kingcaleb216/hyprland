#!/bin/bash

if [[ -n $1 ]]
then
    target_ws=$1
else
    target_ws=$(hyprctl activeworkspace -j | jq -r '.id')
fi

clients=$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == $target_ws) | .address")

for addr in $clients; do
    hyprctl dispatch killwindow address:$addr
done

