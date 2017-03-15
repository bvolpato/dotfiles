#!/bin/sh
#Based on http://www.zoharbabin.com/how-to-do-noise-reduction-using-ffmpeg-and-sox/


usage ()
{
    echo 'Usage : noiseclean.sh <input video file> <output video file>'
    exit
}

if [ "$#" -ne 2 ]
then
  usage
fi

if [ ! -e "$1" ]
then
    echo "File not found: '$1'"
    exit
fi

if [ -e "$2" ]
then
    read -p "File '$2' already exists, overwrite? [y/N]: " yn
    case $yn in
        [Yy]* ) break;;
        * ) exit;;
    esac
fi

inBasename=$(basename "$1")
inExt="${inBasename##*.}"


#read -p "Sample noise start time [00:00:00]: " sampleStart
if [[ -z $sampleStart ]] ; then sampleStart="00:00:00"; fi
#read -p "Sample noise duration [00:00:00.500]: " sampleEnd
if [[ -z $sampleEnd ]] ; then sampleEnd="00:00:00.500"; fi
#read -p "Noise reduction amount [0.21]: " sensitivity
if [[ -z $sensitivity ]] ; then sensitivity="0.21"; fi


tmpAudFile="/tmp/noiseclean_tmpaud.wav"
noiseAudFile="/tmp/noiseclean_noiseaud.wav"
noiseProfFile="/tmp/noiseclean_noise.prof"
tmpAudCleanFile="/tmp/noiseclean_tmpaud-clean.wav"

echo "Outputting to $tmpAudFile..."
ffmpeg -y -i "$1" -qscale 0 "$tmpAudFile"
echo "========================="

ffmpeg -y -i "$1" -vn -ss "$sampleStart" -t "$sampleEnd" "$noiseAudFile"
sox "$noiseAudFile" -n noiseprof "$noiseProfFile"

sox "$tmpAudFile" "$tmpAudCleanFile" noisered "$noiseProfFile" "$sensitivity"

ffmpeg -y -i "$tmpAudCleanFile" "$2"

echo "Done"
