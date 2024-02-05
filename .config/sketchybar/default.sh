#!/bin/sh

bar=(
  blur_radius=25
  color=$MAIN_BG
  height=32
  position=top
  padding_left=8
  padding_right=8
)

default=(
  padding_left=4
  padding_right=4

  background.color=$SECONDARY_BG
  background.corner_radius=4

  icon.font="$FONT:Normal:14.0"
  icon.color=$WHITE
  icon.padding_left=6
  icon.padding_right=4
  label.font="$FONT:Noraml:14.0"
  label.color=$WHITE
  label.padding_left=4
  label.padding_right=6
)

sketchybar --bar "${bar[@]}"
sketchybar --default "${default[@]}"

