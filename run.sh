#!/bin/sh

Xvfb :99 -screen 0 1024x768x16 &
export DISPLAY=:99
x11vnc -display :99 -forever -nopw -rfbport 6123 &

mobius