#!/bin/bash

# Run yay to check for updates
updates=$(yay -S && yay --query -u | wc -l)

if [[ -n "$updates" ]]; then
  # If updates are available, send a notification
	# add notifications here
	notify-send "Package Updates Available" "$updates"	
	echo $updates
fi


