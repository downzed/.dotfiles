#!/bin/bash

# Run bluetoothctl in a subshell and capture the output
output=$(bluetoothctl <<EOF
    devices
    quit
EOF
)

# Extract the connected devices from the output
connected_devices=$(echo "$output" | grep "Connected: yes")

# Display the connected devices
echo "Connected Bluetooth Devices:"
echo "$connected_devices"
