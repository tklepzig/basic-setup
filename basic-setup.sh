#!/bin/bash

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo apt-get -y update
sudo apt-get -y install joe unity-tweak-tool

if [ -f chrome.sh ]; then
    echo "Installing Google Chrome"
    ./chrome.sh
fi



echo "Do you wish to install development stuff?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

sudo apt-get -y install vim git meld npm nodejs-legacy
sudo npm install -g bower gulp-cli ungit live-server nodemon

if [ -f git-config.sh ]; then
    echo "Configure git environment"
    ./git-config.sh
fi

if [ -f atom.sh ]; then
    echo "Installing Atom"
    ./atom.sh
fi

if [ -f atom-packages ]; then
    echo "Installing atom packages"
    apm install --packages-file atom-packages
fi



echo "Do you wish to install multimedia stuff?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

sudo apt-get -y install winff easytag audacity gimp vlc

exit
