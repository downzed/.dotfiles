#!/bin/bash

update() {
  SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk -F:  '($1 ~ "^ *SSID$"){print $2}' | cut -c 2-)
  ICON="󰤥" 

  sketchybar --set $NAME icon="$ICON"
}

case "$SENDER" in
  "wifi_change") update
  ;;
esac
