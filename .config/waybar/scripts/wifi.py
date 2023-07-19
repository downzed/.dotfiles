#!/usr/bin/env python3
import subprocess
import re

# Define a dictionary of Wi-Fi signal icons from the Nerd Fonts
wifi_icons = {
    "good": "󰤨",
    "okay": "󰤢",
    "bad": "󰤠"
}

# Run the "iwconfig" command with the specified interface name and capture its output
output = subprocess.check_output(["iwconfig", "wlp3s0"])

# Decode the output from bytes to a UTF-8 string
output_str = output.decode("utf-8")

# Extract the name and signal strength of the connected Wi-Fi network
match = re.search(r"ESSID:\"(.+?)\".*Signal level=(-?\d+) dBm", output_str)
print()
# If the name or signal strength cannot be found, exit the script with an error message
if not match:
    print("Error: could not retrieve Wi-Fi network information")
    exit(1)

# Extract the name and signal strength values from the match
name = match.group(1)
signal_strength_dbm = int(match.group(2))

# Convert the signal strength from dBm to percentage
signal_strength_pct = 2 * (signal_strength_dbm + 100)

# Ensure the signal strength is within the range [0, 100]
signal_strength_pct = max(min(signal_strength_pct, 100), 0)

# Choose the appropriate Wi-Fi signal icon based on the signal strength
if signal_strength_pct >= 75:
    icon = wifi_icons["good"]
elif signal_strength_pct >= 50:
    icon = wifi_icons["okay"]
else:
    icon = wifi_icons["bad"]

# Print the Wi-Fi network name, signal strength icon, and actual percentage of the signal strength
print(f"{icon} {name} ({signal_strength_pct}%)")
