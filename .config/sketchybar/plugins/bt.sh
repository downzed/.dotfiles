#!/bin/bash

# Function to retrieve the name of the current output device
get_current_output_device() {
    local current_device
    current_device=$(SwitchAudioSource -c | sed 's/ (.*//') # Trimming any extra details, keeping only the device name
    echo "$current_device"
}

# Function to set SketchyBar icon and label based on the current output device
update_sketchybar() {
    local device_name=$1
    local icon="" # Default icon for audio devices

    if [[ "$device_name" == *"Bluetooth"* ]]; then
        icon="" # Bluetooth icon
    fi

    # Updating the SketchyBar item
    sketchybar --set "$NAME" icon="$icon" label="$device_name"
}

main() {
    # Ensure the 'SwitchAudioSource' command is available
    if ! command -v SwitchAudioSource &> /dev/null; then
        printf "SwitchAudioSource command not found. Please install it first.\n" >&2
        return 1
    fi

    local current_device
    current_device=$(get_current_output_device)

    if [[ -z "$current_device" ]]; then
        printf "Could not determine the current output device.\n" >&2
        return 1
    fi

    update_sketchybar "$current_device"
}

main

