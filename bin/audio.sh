#!/bin/sh
echo -n "Enter audio file name: "
read audio_file_name 
echo -n "Enter video file name: "
read video_file_name 
#mencoder -ovc copy -oac copy -audiofile $audio_file_name $video_file_name -o out.mp4
avconv -i $video_file_name -i $audio_file_name -shortest output.mp4
