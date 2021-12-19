#!/usr/bin/env bash

set -e;

sudo apt-get update
sudo apt-get -y install git python3-pip
sudo python3 -m pip install ansible

cd "$HOME"
if [ -d "k2exe-rpi-config/" ]; then 
  echo "repo exists.... checking for updates"
  cd k2exe-rpi-config/
  git pull origin master
else
  git clone https://github.com/k2exe/k2exe-rpi-config.git
fi