#!/bin/bash

root_pwd_dir=$(pwd)

# raspi-config setup
set_raspi_config()
{
    sudo raspi-config nonint do_camera 0    # camera ON
    cat /boot/config.txt | grep do_camera
    sudo raspi-config nonint do_ssh 0       # ssh ON
    cat /boot/config.txt | grep ssh
    sudo raspi-config nonint do_i2c 0       # i2c ON
    cat /boot/config.txt | grep i2c
    sudo raspi-config nonint do_wifi_country JP             # WiFi country
    sudo cat /etc/wpa_supplicant/wpa_supplicant.conf
    sudo raspi-config nonint do_change_locale ja_JP.UTF-8  # Locale
    sudo raspi-config nonint do_change_timezone Asia/Tokyo  # Timezone
#    sudo raspi-config nonint do_expand_rootfs      # Expand Filesystem

    # Raise swap size (raspi-config関係ないけど一応ここで実行)
    sudo sed s/CONF_SWAPSIZE=100/CONF_SWAPSIZE=2048/ /etc/dphys-swapfile > ./dphys-swapfile
    sudo mv ./dphys-swapfile /etc/
    sudo /etc/init.d/dphys-swapfile restart
}

# update package and firmware
initial_update_package()
{
	# update package
	sudo apt update
	sudo apt -yV upgrade

	# update firmware
    sudo apt install rpi-update
	sudo rpi-update
}

# install apt-get package
apt_install()
{
	# setup JAPANESE environment
	sudo apt install -yV fonts-vlgothic
	sudo apt install -yV ibus-mozc

	# install editor
	sudo apt install -yV vim
	sudo apt install -yV vim-gtk

	# install partition setup tool
	sudo apt install -yV gparted

    # install tmux
    sudo apt install -yV tmux
}

# clone git repo
git_clone()
{
    mkdir ~/gitprojects
    cd ~/gitprojects
    git clone http://github.com/calm0815/dotfiles.git
    cd ${root_pwd_dir}
}

# setup dotfiles
setup_dotfiles()
{
    cd ~/gitprojects/dotfiles
    git checkout raspbian
    cp .bashrc ~/
    cp .inputrc ~/
    source ~/.bashrc
    cd ${root_pwd_dir}
}

set_raspi_config
initial_update_package

# set directory name as english
LANG=C xdg-user-dirs-update --force

apt_install
git_clone
setup_dotfiles

source ${root_pwd_dir}/Git/git_install.sh
source ${root_pwd_dir}/ROS/kinetic_test_install.sh
# source ${root_pwd_dir}/ROS/melodic_install.sh
source ${root_pwd_dir}/OpenCV/OpenCV3_install.sh
