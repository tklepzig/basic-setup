#!/bin/bash

add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
apt-get -y update
apt-get -y install joe git npm nodejs-legacy

if [ -f atom-packages ]; then
    cp atom-packages /tmp/atom-packages
fi

cd /tmp

if [ ! -f google-chrome-stable_current_amd64.deb ]; then
    wget  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi

if [ ! -f deb ]; then
    wget https://atom.io/download/deb
fi

dpkg -i google-chrome-stable_current_amd64.deb
dpkg -i deb

apt-get -fy install

npm install -g bower gulp-cli ungit live-server nodemon

if [ -f atom-packages ]; then
    apm install --packages-file atom-packages
fi
