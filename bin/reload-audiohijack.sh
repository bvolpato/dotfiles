#!/bin/sh


running=$(osascript -e 'tell application "System Events" to (name of processes) contains "Audio Hijack"')

if $running; then

  # only run things if it was already playing.
  playing=$(osascript -e 'tell application "System Events" to tell process "Audio Hijack" to get value of checkbox "Run"  of window "System Audio"')

  if [ $playing -eq 1 ]; then
    muted=$(osascript -e "get (output muted of (get volume settings))")
    echo "+ Is muted $muted"
    setMute=false

    if ! $muted; then
      echo "+ Running and not muted, so muting..."
      osascript -e "set volume with output muted"
      setMute=true
    fi

    osascript -e 'tell application "Audio Hijack" to quit'
    sleep 0.1

    open -a "/Applications/Audio Hijack.app"
    sleep 0.1
    #osascript -e 'repeat until window "System Audio" of process "Audio Hijack" exists'

    osascript -e 'tell application "System Events" to tell process "Audio Hijack" to click checkbox "Run"  of window "System Audio"'
    osascript -e 'tell application "Finder" to set visible of application process "Audio Hijack" to false'

    if $setMute; then
      echo "+ Unmuting..."

      osascript -e "set volume without output muted"
    fi
  fi

fi
