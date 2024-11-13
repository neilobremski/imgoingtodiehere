#!/bin/bash

# use ffmpeg to make $1 (mp4) seamless and make the file name $1-seamless.mp4
fileslug=$(basename "$1" | cut -f 1 -d '.')

echo "Making $1 seamless and saving as $fileslug-seamless.mp4"

# get the duration of the video
duration=$(ffprobe -v error -show_entries format=duration -of default=nokey=1:noprint_wrappers=1 "$1")
echo "Duration: $duration seconds"

# set fade duration (in seconds)
fade_duration=1

# calculate the time to delay the overlay (duration - fade_duration)
delayed_time=$(awk "BEGIN {print $duration - $fade_duration}")

echo "Delayed time for overlay: $delayed_time seconds"

# Run ffmpeg command to create seamless loop
ffmpeg -y -i "$1" -filter_complex "\
[0:v]split=2[main][pre];
[pre]trim=duration=$fade_duration,format=yuva420p,\
fade=in:st=0:d=$fade_duration:alpha=1,setpts=PTS+($delayed_time/TB)[overlapped];
[main]trim=start=$fade_duration,setpts=PTS-STARTPTS[base];
[base][overlapped]overlay,format=yuv420p[v]" \
-map "[v]" "$fileslug-seamless.mp4"
