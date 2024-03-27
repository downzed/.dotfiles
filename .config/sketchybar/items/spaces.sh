#!/bin/bash

SPACE_SIDS=(1 2 3 4)

for sid in "${SPACE_SIDS[@]}"
do
  space=(
    space=$sid                                 
    icon=$sid
    background.color=$SECONDARY_BG
    label.color=$SECONDARY_BG2
    icon.color=$SECONDARY_FG
    label.highlight_color=$SECONDARY_FG2
    icon.highlight_color=$SECONDARY_FG2
    label.font="sketchybar-app-font:Regular:14.0"
    label.padding_right=20
    label.y_offset=-1
    icon.drawing=on
    script="$PLUGIN_DIR/space.sh"
)

  sketchybar --add space space.$sid left                                 \
             --set space.$sid "${space[@]}"
done

sketchybar --add item space_separator left                             \
           --set space_separator icon=""                                 \
                                 icon.color=$SECONDARY_FG \
                                 icon.padding_left=4                   \
                                 label.drawing=off                     \
                                 background.drawing=off                \
                                 script="$PLUGIN_DIR/window.sh" \
           --subscribe space_separator space_windows_change
