#!/usr/bin/env python3

import psutil

mem_info = psutil.virtual_memory()
mem_percent = mem_info.percent

if mem_percent < 20:
    icon = ""
elif mem_percent < 40:
    icon = ""
elif mem_percent < 60:
    icon = ""
elif mem_percent < 80:
    icon = ""
else:
    icon = ""

print(f"{icon} {mem_percent}%")

