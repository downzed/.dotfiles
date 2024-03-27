#!/bin/sh

media=(
  label.color=$SPECIAL
  label.max_chars=20 
  icon.padding_left=0
  scroll_texts=on 
  icon=󰀰             
  icon.color=$SPECIAL   
  icon.padding_right=5 
  script=$PLUGIN_DIR/media.sh
  background.drawing=off 
  on_click=playerctl play-pause
)

sketchybar --add item media e --set media "${media[@]}" --subscribe media media_change
