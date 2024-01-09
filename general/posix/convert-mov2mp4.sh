#!/bin/sh

if ! ./commandisinstalled.sh ffmpeg &> /dev/null
then
    echo "** No está instalado ffmpeg **"
    echo "Antes de utilizar este script, instalá mmpeg "
    echo "  En Mac: brew install ffmpeg"
    echo "     (más info: https://phoenixnap.com/kb/ffmpeg-mac)"    
    echo "  En Linux o Windows ver este link: "
    echo "              https://www.hostinger.com/tutorials/how-to-install-ffmpeg"
    exit -1
fi

VERSION=eval(ffmpeg -version | grep 'ffmpeg version' | sed 's/ffmpeg version \([-0-9.]*\).*/\1/')
echo $VERSION
OUTPUT_DEFAULT="output.mp4"

if [[ ($# -lt 1) ]]; then
    echo "** Illegal number of parameters **"
    echo "Usage: "
    echo "  convert-mov2mp4.sh {input_video_file} ({output_video_file})"
    echo "  if not {output_video_file}, default name: $OUTPUT_DEFAULT"

    exit 2
fi

INPUT=$1
OUTPUT=$2

# Conversión de video MOV a MP4 con encodeo

ffmpeg -i $INPUT -crf 23 -preset medium -movflags +faststart -c:a aac ${OUTPUT:-$DEFAULT}
