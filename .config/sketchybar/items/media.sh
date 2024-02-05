#!/bin/sh

media=(
  label.color=$SECONDARY_FG2
  label.max_chars=20 
  scroll_texts=on 
  icon=󰀰             
  icon.padding_left=0
  icon.padding_right=5 
  icon.color=$SECONDARY_FG2   
  script=$PLUGIN_DIR/media.sh
  background.drawing=off 
  # on_click=toggle_mpv
)

sketchybar --add item media e --set media "${media[@]}" --subscribe media media_change
