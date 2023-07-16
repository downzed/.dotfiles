#!/usr/bin/env python3

import subprocess

def get_volume_info():
    cmd = ["pamixer", "--get-volume"]
    output = subprocess.check_output(cmd).decode("utf-8").strip()
    return int(output)

volume = get_volume_info()

if volume == 0:
    icon = "婢"
else:
    icon = "墳"
    
print(f"{icon} {volume}%")

