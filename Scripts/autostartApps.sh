#!/usr/bin/env bash
sleep 3

# First Desktop apps
wmctrl -s 0
flatpak run com.discordapp.Discord --enable-blink-features=MiddleClickAutoscroll &

while ! wmctrl -l | grep -iq discord; do
  sleep 0.2
done

# Second Desktop apps
wmctrl -s 1
ghostty --fullscreen=true &

sleep 0.5

wmctrl -s 0
