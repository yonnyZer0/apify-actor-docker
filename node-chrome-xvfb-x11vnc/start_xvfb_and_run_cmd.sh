#!/bin/bash

echo "Starting X virtual framebuffer using: Xvfb $DISPLAY -ac -screen 0 $XVFB_WHD -nolisten tcp"

Xvfb $DISPLAY -ac -screen 0 $XVFB_WHD -nolisten tcp &

echo "Starting persistent x11vnc server listening on port 5900."
echo "FYI: Run container with parameter e.g. \"-p 5900:5900\" to map container port to local port."
x11vnc -display :99 -forever -rfbport 5900 -q &

echo "Now you can access it access it by cmd: \"xtigthvncviewer localhost:5900\" ."

# Execute CMD (original CMD of this Dockerfile gets overriden in Actor build)
echo "Executing main command"
exec "$@"
