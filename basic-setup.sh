#!/bin/bash

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo apt-get -y update
sudo apt-get -y install joe git npm nodejs-legacy

if [ -f atom-packages ]; then
    cp atom-packages /tmp
fi

cd /tmp

if [ ! -f google-chrome-stable_current_amd64.deb ]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi

if [ ! -f deb ]; then
    wget https://atom.io/download/deb
fi

sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg -i deb

sudo apt-get -fy install

sudo npm install -g bower gulp-cli ungit live-server nodemon

if [ -f git-config.sh ]; then
    echo "Configure git environment"
    ./git-config.sh
fi

if [ -f atom-packages ]; then
    echo "Installing atom packages"
    apm install --packages-file atom-packages
fi
