#!/bin/bash

# author: Karel Fiala
# email: fiala.karel@gmail.com


ffmpeg -framerate 2 -start_number 100 -i photo-%3d.jpg -loglevel error -stats -threads 4 -f mp4 -s:v 1920x1080 -c:v libx264 -r 30 -preset medium -crf 23 -tune fastdecode -movflags faststart -pix_fmt yuv420p -minrate 0 -maxrate 6000k -bufsize 1000k -refs 1 -coder 1 -g 60 -mbd 2 -trellis 1 -bf 2 -qmax 44 -map_metadata 0 stop-motion.mp4

exiftool -TagsFromFile photo-100.jpg stop-motion.mp4

exit 0

