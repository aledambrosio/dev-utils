#!/bin/sh

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if ! ${SCRIPT_DIR}/commandisinstalled.sh ffmpeg &> /dev/null
then
    echo "** No está instalado ffmpeg **"
    echo "Antes de utilizar este script, instalá mmpeg "
    echo "  En Mac: brew install ffmpeg"
    echo "     (más info: https://phoenixnap.com/kb/ffmpeg-mac)"    
    echo "  En Linux o Windows ver este link: "
    echo "              https://www.hostinger.com/tutorials/how-to-install-ffmpeg"
    exit -1
fi

# VERSION=eval(ffmpeg -version | grep 'ffmpeg version' | sed 's/ffmpeg version \([-0-9.]*\).*/\1/')
# echo $VERSION
OUTPUT_DEFAULT="output.mp3"

if [[ ($# -lt 1) ]]; then
    echo "** Illegal number of parameters **"
    echo "Usage: "
    echo "  convert-wav2mp3.sh {input_audio_file} ({output_audio_file})"
    echo "  if not {output_audio_file}, default name: $OUTPUT_DEFAULT"

    exit 2
fi

INPUT=$1
OUTPUT=$2

echo "Converting $INPUT to $OUTPUT"
# Conversión de audio WAV a MP3 con encodeo

ffmpeg -i $INPUT -vn -ar 44100 -ac 2 -b:a 192k ${OUTPUT:-$DEFAULT}
