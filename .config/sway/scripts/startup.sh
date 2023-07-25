#!/usr/bin/bash
declare -A apps_workspaces
apps_workspaces+=(["kitty"]="1" ["firefox"]="2" ["spotify"]="3")

for app in "${!apps_workspaces[@]}"; do
  $app &
done

