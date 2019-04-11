#!/bin/bash

pwd_dir=$(pwd)

if [ "$2" = "--auto" ]; then
	auto_flg=1
else
	auto_flg=0
fi

echo "
     ██████╗ ██████╗ ███████╗███╗   ██╗ ██████╗██╗   ██╗                      
    ██╔═══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝██║   ██║                      
    ██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║     ██║   ██║                      
    ██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║     ╚██╗ ██╔╝                      
    ╚██████╔╝██║     ███████╗██║ ╚████║╚██████╗ ╚████╔╝                       
     ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝  ╚═══╝                        
                                                                          
    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝"

sudo apt update
sudo apt install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libgtk2.0-dev libatlas-base-dev gfortran python-numpy python3-numpy python-pip python3-pip
mkdir package
cd package/
wget https://github.com/mt08xx/files/raw/master/opencv-rpi/libopencv3_3.3.1-20171126.2_armhf.deb
sudo apt install -y ./libopencv3_3.3.1-20171126.2_armhf.deb
sudo ldconfig
cd ${pwd_dir}
echo "OpenCV3.3.1 install finished !!"
