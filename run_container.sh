#!/bin/bash

# Run xash3d container

# Set X forwarding (it reverts back to normal on reboot)
xhost local:root

# Needs SUDO, if you configured Docker differently (eg. to be launched by normal users) please remove "sudo"
sudo docker run -it --rm --name xash3d -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v $(pwd)/games/valve:/root/halflife/valve:rw -e DISPLAY=$DISPLAY --device /dev/snd --device /dev/dri xash3d

