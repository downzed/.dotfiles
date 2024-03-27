#!/bin/bash

convert_to_roman() {
  local number=$1
  declare -A roman=( [1000]=M [900]=CM [500]=D [400]=CD [100]=C [90]=XC [50]=L [40]=XL [10]=X [9]=IX [5]=V [4]=IV [1]=I )
  
  local result=""
  for value in "${!roman[@]}"
  do
    while (( number >= value ))
    do
      result+="${roman[$value]}"
      ((number -= value))
    done
  done

  if [[ "$result" == "IIII" ]]; then
    result="IV"
  fi
  echo $result
}

SPACE_SIDS=(1 2 3 4)

for sid in "${SPACE_SIDS[@]}"
do
  roman_sid=$(convert_to_roman $sid)
  space=(
    space=$sid                                 
    icon=$roman_sid
    background.color=$SECONDARY_BG
    label.color=$MAIN_FG
    icon.color=$SECONDARY_FG
    label.highlight_color=$SECONDARY_FG2
    icon.highlight_color=$SECONDARY_FG2
    label.font="sketchybar-app-font:Regular:14.0"
    label.padding_right=2
    label.padding_left=2
    label.y_offset=0
    icon.drawing=on
    script="$PLUGIN_DIR/space.sh"
)

  sketchybar --add space space.$sid left                                 \
             --set space.$sid "${space[@]}"
done

# sketchybar --add item space_separator left                             \
#            --set space_separator icon=""                                 \
#                                  icon.color=$SECONDARY_FG \
#                                  icon.padding_left=6                   \
#                                  icon.padding_right=6                   \
#                                  icon.font="$FONT:Normal:18.0" \
#                                  label.drawing=off                     \
#                                  background.drawing=off                \
#                                  # script="$PLUGIN_DIR/window.sh" \
#            --subscribe space_separator space_windows_change
