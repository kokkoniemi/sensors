#!/bin/bash

# First sample
cpu1=($(grep '^cpu ' /proc/stat))
idle1=${cpu1[4]}
total1=0
for val in "${cpu1[@]:1}"; do
  total1=$((total1 + val))
done

sleep 1

# Second sample
cpu2=($(grep '^cpu ' /proc/stat))
idle2=${cpu2[4]}
total2=0
for val in "${cpu2[@]:1}"; do
  total2=$((total2 + val))
done

idle=$((idle2 - idle1))
total=$((total2 - total1))
#usage=$((100 * (total - idle) / total))
usage=$(echo "scale=2; 100 * ($total - $idle) / $total" | bc)

echo "$usage%"

