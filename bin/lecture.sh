#!/bin/bash

export LECTURE="$1"
ffmpeg -i "$LECTURE.mov" "$LECTURE.mp4"
ffmpeg -i "$LECTURE.mp4" "$LECTURE.mp3"
noiseclean.sh "$LECTURE.mp3" "$LECTURE-denoise.mp3"
ffmpeg -i "$LECTURE-denoise.mp3" -af silenceremove=0:0:0:-1:3:-90dB "$LECTURE-denoise-trim.mp3"
