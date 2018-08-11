#!/bin/bash

echo "Starting X virtual framebuffer using: Xvfb $DISPLAY -ac -screen 0 $XVFB_WHD -nolisten tcp"

Xvfb $DISPLAY -ac -screen 0 $XVFB_WHD -nolisten tcp &

echo "starting persistent x11vnc server listening on port 5900"
x11vnc -display :99 -forever -rfbport 5900 &

# Execute CMD (original CMD of this Dockerfile gets overriden in Actor build)
echo "Executing main command"
exec "$@"
