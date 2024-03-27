#!/bin/sh

sketchybar --add item calendar right  \
           --set calendar icon= \
                          script="$PLUGIN_DIR/calendar.sh" \
                          update_freq=30 \
                          background.drawing=on \
                          background.color=$SECONDARY_BG2 \

