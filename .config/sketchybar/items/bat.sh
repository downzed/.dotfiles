#!/bin/sh

sketchybar --add item battery right \
           --set battery update_freq=120 script="$PLUGIN_DIR/battery.sh" \
                              background.drawing=on \
                              background.color=$SPECIAL \
           --subscribe battery system_woke power_source_change

