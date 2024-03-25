#!/bin/sh

sketchybar --add item calendar right  \
           --set calendar icon= \
                          script="$PLUGIN_DIR/calendar.sh" \
                          update_freq=30 \

