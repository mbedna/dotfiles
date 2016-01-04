#!/bin/sh

echo -n "Enter output file name: "
read file_name 
if [ -z "$file_name" ]; then
    file_name="video.mp4"
fi
echo -n "Record with sound? (Y/N):"
read with_sound 
echo -n "How many seconds to sleep?:"
read sleep_in_sec 

if [ -n "$sleep_in_sec" ]; then
  for c in $(seq 1 $sleep_in_sec);
  do
      echo -n "$c ... "
      sleep 1
  done
fi

fullscreen=$(xwininfo -root | grep 'geometry' | awk '{print $2;}')
if [ -n "$with_sound" ] && [ $with_sound = 'Y' ]; then 
    echo Started recording with sound... 
    avconv -f alsa -i pulse -f x11grab -r 30 -s $fullscreen -i :0.0 -vcodec libx264 -preset ultrafast -threads 4 -y $name
else
    echo Started recording without sound... 
#    avconv -f x11grab -r 30 -s $fullscreen -i :0.0+0,0 -vcodec libx264 -s 1280x720 -r 30 -pre lossless_ultrafast -threads 4 $file_name
    #avconv -f x11grab -r 30 -s $fullscreen -i :0.0+0,0 -vcodec libx264 -b 1024k -s 1280x720 -r 30 -threads 4 $file_name
    avconv -f x11grab -r 30 -s $fullscreen -i :0.0+0,0 -vcodec libx264 -r 30 -threads 4 $file_name


#    avconv -f x11grab -r 30 -s $fullscreen -i :0.0+0,0 -qscale 0.1 -vf crop=in_w:in_h-25:0:25 -vcodec libx264 -r 30 -threads 4 $file_name
#    avconv -f x11grab -r 30 -b 11m -s $fullscreen -i :0.0+0,0 -vcodec libx264 -b 11m -r 30 -threads 4 $file_name
   # avconv -f x11grab -r 30 -s $fullscreen -i :0.0+0,0 -vcodec libx264 -pre lossless_ultrafast -threads 4 $file_name
fi
