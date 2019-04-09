#!/bin/bash

pwd_dir=$(pwd)

if [ "$2" = "--auto" ]; then
	auto_flg=1
else
	auto_flg=0
fi

sudo apt-get install git -y
sudo git config --global user.email "ku_skyline_wa@yahoo.co.jp"
sudo git config --global user.name "calm0815"