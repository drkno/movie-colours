#!/bin/bash

output=`pwd`

directory=`dirname "$1"`
filename=`basename "$1" | rev | cut -f 2- -d '.' | rev`
extension=`echo "$1" | rev | cut -f 1 -d '.' | rev`

ffmpeg -i "$1" -filter:v "scale=1:150:out_color_matrix=bt601:out_range=pc" -r 1 -f image2pipe -c:v ppm - | convert '(' '+append' - ')' -resize 500x150! "$output/$filename.png"
