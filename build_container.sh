#!/bin/bash

# Build containers and game engine
# Needs SUDO, if you configured Docker to be launched also for normal users, please remove sudo
sudo docker build . -t xash3d

