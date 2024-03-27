#!/bin/bash

# showing only number of open apps
if [ "$SENDER" = "space_windows_change" ]; then
  # Extract the space ID from the INFO variable.
  space="$(echo "$INFO" | jq -r '.space')"

  # Get a list of open apps in the current space.
  apps="$(echo "$INFO" | jq -r '.apps | keys[]')"
 
  app_count=""
  if [ "${apps}" != "" ]; then
    # Count the number of open apps.
    app_count=$(echo "$apps" | wc -l | xargs)
  fi
  
  # Update the label for the current space in sketchybar to show the number of open apps.
  sketchybar --set space.$space label="$app_count"
fi


# showing all open apps icons
# if [ "$SENDER" = "space_windows_change" ]; then
#   space="$(echo "$INFO" | jq -r '.space')"
#   apps="$(echo "$INFO" | jq -r '.apps | keys[]')"

#   icon_strip=" "
#   if [ "${apps}" != "" ]; then
#     while read -r app
#     do
#       icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
#     done <<< "${apps}"
#   else
#     icon_strip=" —"
#   fi

#   sketchybar --set space.$space label="$icon_strip" 
# fi
