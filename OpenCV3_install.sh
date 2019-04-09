#!/bin/bash

echo "Install OpenCV3 (only for desktop build)"
sudo apt install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libgtk2.0-dev libatlas-base-dev gfortran python-numpy
mkdir ~/gitprojects
cd ~/gitprojects
git clone https://github.com/opencv/opencv.git -b 3.4.1 --depth 1 opencv_source
cd opencv_source
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j2
sudo make install