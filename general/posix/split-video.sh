#!/bin/sh

if ! ./commandisinstalled.sh ffmpe &> /dev/null
then
    echo "** No está instalado ffmpeg **"
    echo "Antes de utilizar este script, instalá mmpeg "
    echo "  En Mac: brew install ffmpeg"
    echo "     (más info: https://phoenixnap.com/kb/ffmpeg-mac)"    
    echo "  En Linux o Windows ver este link: "
    echo "              https://www.hostinger.com/tutorials/how-to-install-ffmpeg"
    exit -1
fi

if [[ ($# -lt 4) ]]; then
    echo "** Illegal number of parameters **"
    echo "Usage: "
    echo "  split-video.sh {input_video_file} {output_video_file_1} {output_video_file_2} {end_time_output_1} {start_time_output_2}"

    exit 2
fi

INPUT=$1
OUTPUT_BEFORE_t=$2
OUTPUT_AFTER_ss=$3

END_TIME_1=$4
START_TIME_2=$5

# Corte de videos
# ffmpeg -i INPUT.mp4 -t END_TIME_1 -c copy OUTPUT-BEFORE-t.mp4 -ss START_TIME_2 -c copy OUTPUT-AFTER-ss.mp4

ffmpeg -i $INPUT -t $END_TIME_1 -c copy $OUTPUT_BEFORE_t -ss ${START_TIME_2:-$END_TIME_1} -c copy $OUTPUT_AFTER_ss

exit 0
