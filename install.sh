#!/usr/bin/env bash

set -e;

sudo apt-get update
sudo apt-get -y install git ansible

cd "$HOME"

git clone https://github.com/k2exe/k2exe-rpi-config.git
