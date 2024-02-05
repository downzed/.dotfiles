#!/usr/bin/env bash

workspace_info=$(hyprctl activewindow | grep "workspace: ")

regex="workspace: ([0-9]+) \([0-9]+\)"

if [[ $workspace_info =~ $regex ]]; then
    workspace_num="${BASH_REMATCH[1]}"
fi

echo $workspace_num

