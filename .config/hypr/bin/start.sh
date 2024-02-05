#!/usr/bin/env bash

sleep 1
# Kill already running process
_ps=(swayidle mako polkit-kde-authentication-agent-1 hyprpaper xdg-desktop-portal-hyprland xdg-desktop-portal)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# xdg 
/usr/lib/xdg-desktop-portal-hyprland &

/usr/lib/xdg-desktop-portal &

sleep 2
/usr/lib/xdg-document-portal &

xdg-user-dirs-update &

# polkit agent
/usr/lib/polkit-kde-authentication-agent-1 &
 

# swayidle
exec swayidle -w \
  timeout 300 'swaylock -f' \
  timeout 350 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' &

# other apps
mako &
hyprpaper &


