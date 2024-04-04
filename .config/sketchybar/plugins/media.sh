#!/bin/sh

APP=""

update() {
  STATE="$(echo "$INFO" | jq -r '.state')"
  APP="$(echo "$INFO" | jq -r '.app')"

  case "$NAME" in
    "spotify.play")
      if [ "$STATE" = "playing" ]; then
        sketchybar --set $NAME icon="󰏤"
      else
        sketchybar --set $NAME icon=""
      fi
      ;;
    "spotify.main")
      MEDIA="$(echo "$INFO" | jq -r '.artist + " - " + .title')"

      # if [ "$STATE" = "playing" ]; then
      #   sketchybar --set $NAME label="$MEDIA" icon=""
      # else
        sketchybar --set $NAME icon="$($CONFIG_DIR/plugins/icon_map.sh "$APP")"
      # fi
      ;;
  esac
}

click() {
  # open current media player
  case "$NAME" in
    "spotify.main") osascript -e 'tell application "Spotify" to activate'
      ;;
    "spotify.play") play_pause
      ;;
    "spotify.prev") prev
      ;;
    "spotify.next") next
      ;;
  esac
}

play_pause() {
  osascript -e 'tell application "Spotify" to playpause'

}
play_change(){
  sketchybar --set $NAME icon=">>"

}

next() {
  osascript -e 'tell application "Spotify" to next track'
}

prev() {
  osascript -e 'tell application "Spotify" to previous track'
}

case "$SENDER" in
  "media_change") update
    ;;
  "mouse.clicked") click
    ;;
esac

