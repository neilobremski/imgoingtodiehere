#!/bin/bash

# Check if two arguments are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <video_file> <audio_file>"
  exit 1
fi

# Extract the filename without extension
fileslug=$(echo "$1" | cut -f 1 -d '.')

# Combine the video and audio using ffmpeg
ffmpeg -i "$1" -i "$2" -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 "${fileslug}-audio.mp4"

echo "Combined video and audio saved as ${fileslug}-audio.mp4"