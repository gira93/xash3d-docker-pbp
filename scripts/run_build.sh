#!/bin/bash

# This scripts builds all the game engine parts

cd ~/src/xash3d/build

cmake -DHL_SDK_PATH=../hlsdk/ -DXASH_VGUI=no -DXASH_NANOGL=yes -DXASH_GLES=yes ..
make -j2

cd ~/src/hlsdk-xash3d/build
cmake ../
make -j2

