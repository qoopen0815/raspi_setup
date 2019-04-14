#!/bin/bash

pwd_dir=$(pwd)

if [ "$2" = "--auto" ]; then
	auto_flg=1
else
	auto_flg=0
fi

echo "
    ██████╗  ██████╗ ███████╗      
    ██╔══██╗██╔═══██╗██╔════╝      
    ██████╔╝██║   ██║███████╗      
    ██╔══██╗██║   ██║╚════██║      
    ██║  ██║╚██████╔╝███████║      
    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝      
                                                                          
    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝"

echo "Setup ROS Repositories"
sudo apt update
sudo apt upgrade -yV
sudo apt install dirmngr -yV
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt update

echo "Install Bootstrap Dependencies"
sudo apt-get install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake

echo "Initializing rosdep"
sudo rosdep init
rosdep update

echo "Create a catkin Workspace"
mkdir ~/ros_catkin_ws
cd ~/ros_catkin_ws/
rosinstall_generator desktop --rosdistro kinetic --deps --wet-only --tar > kinetic-desktop-wet.rosinstall
wstool init src kinetic-desktop-wet.rosinstall

echo "Resolving Dependencies with rosdep"
rosdep install -y --from-paths src --ignore-src --rosdistro kinetic -r --os=debian:stretch

echo "Build"
sudo ./src/catkin/bin/catkin_make_isolated -j1 --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/kinetic

echo "Load ROS"
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "ROS(kinetic) Install finished !!"