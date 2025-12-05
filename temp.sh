#!/bin/bash

# Initialize max temperature
max_temp=0

# Loop over all thermal zones
for zone in /sys/class/thermal/thermal_zone*/temp; do
    temp=$(cat "$zone")
    temp=$(echo "scale=1; $temp/1000" | bc)
    max_temp=$(echo "if ($temp>$max_temp) $temp else $max_temp" | bc)
done

echo "${max_temp}°C"

