#!/usr/bin/env python3

import subprocess

weather_info = 'is it...'
def get_weather_info():
    cmd = ["curl", "-s", "wttr.in/?format=%C+%t"]
    output = subprocess.check_output(cmd).decode("utf-8").strip()
    return output

weather_info = get_weather_info()

print(f"盛 {weather_info}")

