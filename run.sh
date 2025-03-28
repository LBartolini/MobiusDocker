#!/bin/sh

Xvfb :99 -screen 0 1920x1080x16 &
export DISPLAY=:99
fluxbox &
x11vnc -display :99 -forever -nopw -rfbport 6123 &

echo "Started VNC"

mobius