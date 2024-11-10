# use ffmpeg to make $1 (mp4) a bounce and make the file name $1-bounce.mp4
fileslug=$(echo $1 | cut -f 1 -d '.')
echo "Making $1 a bounce and saving as $fileslug-bounce.mp4"

# create a reversed version of the video
ffmpeg -i "$1" -vf reverse reversed.mp4

# make filelist.txt
echo "file '$1'" > filelist.txt
echo "file 'reversed.mp4'" >> filelist.txt

# concatenate the original and reversed video to make a bounce
ffmpeg -f concat -safe 0 -i filelist.txt -c copy "$fileslug-bounce.mp4"

# remove the reversed video and filelist.txt
rm reversed.mp4
rm filelist.txt
