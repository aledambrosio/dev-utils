#!/bin/sh


if ./commandisinstalled.sh ffmpeg &> /dev/null
then
    echo "ffmpeg dio 0"
fi

if ! ./commandisinstalled.sh ffmpe &> /dev/null
then
    echo "ffmpe dio -1"
fi


# VERSION=$(ffmpeg -version | grep 'ffmpeg version' | sed 's/ffmpeg version \([-0-9.]*\).*/\1/')
# echo $VERSION
