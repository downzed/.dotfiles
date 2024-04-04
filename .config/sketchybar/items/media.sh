#!/bin/sh

spotify=(
  label.color=$SECONDARY_FG2
  label.max_chars=20 
  scroll_texts=on 
  icon.padding_left=0
  icon.padding_right=5 
  icon.color=$SECONDARY_FG2   
  script=$PLUGIN_DIR/media.sh
  background.drawing=off 
)

sketchybar --add item spotify.prev e                             \
           --set spotify.prev icon=                                 \
                            icon.color=$SECONDARY_FG \
                            icon.padding_left=6                   \
                            icon.padding_right=6                   \
                            icon.font="$FONT:Normal:18.0" \
                            label.drawing=off                     \
                            background.drawing=off                \
                            script=$PLUGIN_DIR/media.sh \
            --subscribe spotify.prev mouse.clicked

sketchybar --add item spotify.play e                             \
           --set spotify.play icon=                                 \
                            icon.color=$SECONDARY_FG \
                            icon.padding_left=6                   \
                            icon.padding_right=2                   \
                            icon.font="$FONT:Normal:20.0" \
                            label.drawing=off                     \
                            background.drawing=off                \
                            script=$PLUGIN_DIR/media.sh \
           --subscribe spotify.play mouse.clicked media_change

sketchybar --add item spotify.next e                             \
           --set spotify.next icon=                                 \
                            icon.color=$SECONDARY_FG \
                            icon.padding_left=6                   \
                            icon.padding_right=6                   \
                            icon.font="$FONT:Normal:18.0" \
                            label.drawing=off                     \
                            background.drawing=off                \
                            script=$PLUGIN_DIR/media.sh \
           --subscribe spotify.next mouse.clicked

sketchybar --add item spotify.main e \
  --set spotify.main "${spotify[@]}" \
        icon.font="sketchybar-app-font:Regular:14.0" \
  --subscribe spotify.main media_change mouse.clicked

