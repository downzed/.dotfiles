#!/bin/bash

# Check if lid is closed
lid_state=$(cat /proc/acpi/button/lid/LID0/state | awk '{print $2}')

if [ "$lid_state" == "closed" ]; then
  # Suspend the laptop
  #sleep 0.5 
  #hyprctl dispatch exit
  systemctl suspend
  # Restart the display manager service after resume
  #systemctl restart display-manager.service
fi

