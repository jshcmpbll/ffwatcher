#!/bin/bash
output="/media/sdv1/camplab/Files/Converted/"
file=$(basename "$1" .mkv)
file=$(basename "$file" .mp4)
file=$(basename "$file" .MKV)
file=$(basename "$file" .MP4)
file=$(basename "$file" .webm)
file=$(basename "$file" .WEBM)
output+=$file
output+=".mp4"
ffmpeg -i $1 -f mp4 -vcodec copy -acodec copy $output
#echo $output
