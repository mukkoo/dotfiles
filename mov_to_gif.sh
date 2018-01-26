#!/bin/sh
palette="/tmp/palette.png"
filters="fps=9,scale=600:-1:flags=bicubic"
ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
