#!/bin/bash

declare -A dir_sizes


for dir in */; do
    if [ -d "$dir" ]; then
        size=$(du -sh "$dir" | cut -f1)
        dir_sizes["$dir"]="$size"
    fi
done

for dir in "${!dir_sizes[@]}"; do
    echo -e "${dir}\t${dir_sizes[$dir]}"
done | sort -k2 -h