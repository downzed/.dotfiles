#!/usr/bin/env python3

import psutil

cpu_percent = psutil.cpu_percent(interval=1)

if cpu_percent < 20:
    icon = ""
elif cpu_percent < 40:
    icon = ""
elif cpu_percent < 60:
    icon = ""
elif cpu_percent < 80:
    icon = ""
else:
    icon = ""

print(f"{icon} {cpu_percent}%")

