#!/bin/sh

sketchybar --add item front_app left \
           --set front_app script="$PLUGIN_DIR/front_app.sh" \
                           background.color=$MAIN_BG \
                           label.padding_right=12 \
                           label.padding_left=8 \
                           label.color=$HIGHLIGHT \
                           icon.padding_left=12 \
                           icon.drawing=on \
                           icon.color=$HIGHLIGHT \
                           icon.font="sketchybar-app-font:Regular:14.0" \
           --subscribe front_app front_app_switched



