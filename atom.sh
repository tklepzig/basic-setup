#!/bin/bash

cd /tmp

if [ ! -f deb ]; then
    wget https://atom.io/download/deb
fi

sudo dpkg -i deb
sudo apt-get -fy install
