#!/bin/bash

# concat multiple MP4 video files to one

# syntax for concat
# ffmpeg -i "concat:01 Contracts.wma|02 Marketing.wma" output.mp3

if [[ $# -lt 2 ]]
then
    printf "\n\n\tWrong arguments\n\n"
    exit 1
fi

files=""
name=""
f="0"

for var in "$@"
do
    files="$files -cat $var"
    if [[ $f -eq 0 ]]
    then
        name="`echo $var | cut -d"." -f 1`"
        f="1"
    else
        name="$name-`echo $var | cut -d"." -f 1`"    
    fi
done


MP4Box $files -new $name.mp4

exit 0