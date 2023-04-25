#!/usr/bin/env python3

import subprocess

def get_battery_info():
    cmd = ["upower", "-i", "/org/freedesktop/UPower/devices/battery_BAT0"]
    output = subprocess.check_output(cmd).decode("utf-8")
    lines = output.split("\n")
    battery_info = {}
    for line in lines:
        parts = line.split(":")
        if len(parts) > 1:
            key = parts[0].strip()
            value = parts[1].strip()
            battery_info[key] = value
    return battery_info

battery_info = get_battery_info()

if "state" in battery_info:
    state = battery_info["state"]
else:
    state = "unknown"

if "percentage" in battery_info:
    percentage = battery_info["percentage"]
else:
    percentage = "unknown"

print(f"{state} {percentage}%")

