#!/bin/sh

osascript -e "set volume with output muted"

osascript -e 'tell application "Audio Hijack" to quit'
sleep 0.2
open -a "/Applications/Audio Hijack.app"
sleep 0.2
osascript -e 'tell application "System Events" to tell process "Audio Hijack" to click checkbox "Run"  of window "System Audio"'
osascript -e 'tell application "Finder" to set visible of application process "Audio Hijack" to false'
sleep 0.2
osascript -e "set volume without output muted"
