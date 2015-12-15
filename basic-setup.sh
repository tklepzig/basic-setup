#!/bin/bash

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo apt-get -y update
sudo apt-get -y install joe vim git meld npm nodejs-legacy
sudo npm install -g bower gulp-cli ungit live-server nodemon

if [ -f git-config.sh ]; then
    echo "Configure git environment"
    ./git-config.sh
fi

if [ -f chrome.sh ]; then
    echo "Installing Google Chrome"
    ./chrome.sh
fi

if [ -f atom.sh ]; then
    echo "Installing Atom"
    ./atom.sh
fi

if [ -f atom-packages ]; then
    echo "Installing atom packages"
    apm install --packages-file atom-packages
fi
