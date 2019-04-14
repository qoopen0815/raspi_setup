# raspi_setup
Raspbian stretch auto setup script

## Install Package
- JAPANESE environment(fonts-vlgothic, ibus-mozc)
- Editor(vim, vim-gtk)
- Pertition tool(gparted)
- Terminal(tmux)
- Git
- OpenCV 3.3.1
- ROS kinetic or melodic

## Setting
```bash
sudo raspi-config nonint do_camera 0    # camera ON
sudo raspi-config nonint do_ssh 0       # ssh ON
sudo raspi-config nonint do_i2c 0       # i2c ON
sudo raspi-config nonint do_wifi_country JP             # WiFi country => JP
sudo raspi-config nonint do_change_locale ja_JP.UTF-8   # Locale => JP/UTF-8
sudo raspi-config nonint do_change_timezone Asia/Tokyo  # Timezone => Asia/Tokyo

# Raise swap size
sudo sed s/CONF_SWAPSIZE=100/CONF_SWAPSIZE=2048/ /etc/dphys-swapfile > ./dphys-swapfile
sudo mv ./dphys-swapfile /etc/
sudo /etc/init.d/dphys-swapfile restart
```

## Preparation
- Installation of Raspbian Stretch
- Connect to Network

## Heat Sink
If you use Raspberry Pi3 for heavy processing without a heat sink, it will often become unresponsive, probably due to thermal runaway.
Therefore, I recommend using a heat sink if you want Raspberry Pi3 to perform heavy processing.

## Before Installation
- Initial Update
- Expand Filesystem
- Reboot
```bash
sudo sudo apt update && sudo apt -y upgrade
sudo raspi-config nonint do_expand_rootfs      # Expand Filesystem
sudo reboot
```

## Installation
- Clone this repository
```bash
git clone http://github.com/calm0815/raspi_setup.git
```

- Run script
```bash
cd raspi_setup
source raspi_setup.sh
```

Errors often occur in the installation of ROS, but do your best !
