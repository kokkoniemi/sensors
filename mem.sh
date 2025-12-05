#!/bin/bash

# Read MemTotal and MemAvailable in kB
mem_total_kb=$(grep -i '^MemTotal:' /proc/meminfo | awk '{print $2}')
mem_available_kb=$(grep -i '^MemAvailable:' /proc/meminfo | awk '{print $2}')

# Calculate used memory
mem_used_kb=$(( mem_total_kb - mem_available_kb ))

# Convert kB → GiB
mem_used_gb=$(echo "scale=1; $mem_used_kb/1024/1024" | bc)
mem_total_gb=$(echo "scale=1; $mem_total_kb/1024/1024" | bc)

echo "${mem_used_gb} GiB / ${mem_total_gb} GiB"
