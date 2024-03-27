#!/bin/sh

sketchybar --add item front_app left \
           --set front_app script="$PLUGIN_DIR/front_app.sh" \
                           background.color=$SECONDARY_BG \
                           label.padding_right=8 \
                           label.padding_left=8 \
                           icon.drawing=on \
                           label.color=$MAIN_FG \
                           icon.font="sketchybar-app-font:Regular:14.0" \
           --subscribe front_app front_app_switched



