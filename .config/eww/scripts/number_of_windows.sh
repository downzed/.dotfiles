#!/bin/bash

# Get the workspace information from the hyprctl command
json=$(hyprctl workspaces -j)
num_windows=$(echo "$json" | jq '.[].windows')
num_id=$(echo "$json" | jq '.[].id')
#echo "Number of Windows: $num_windows"

#echo $num_windows
if ((num_windows > 0))
then
    echo " - Windows: $num_windows"
fi
