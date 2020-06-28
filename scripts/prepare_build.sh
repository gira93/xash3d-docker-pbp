#!/bin/bash

# This script clones and prepares all directories for building
cd ~/src
git clone --recursive https://github.com/FWGS/xash3d
cd xash3d
git clone https://github.com/ValveSoftware/halflife hlsdk/
cd engine
git clone https://github.com/FWGS/nanogl
cd ..
mkdir -p build
cd ~/src
git clone https://github.com/FWGS/hlsdk-xash3d
cd hlsdk-xash3d
mkdir build

