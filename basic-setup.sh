#!/bin/bash

install_development=false;
install_multimedia=false;

echo "Do you wish to install development stuff?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) install_development=true; break;;
        No ) install_development=false; break;;
    esac
done

echo "Do you wish to install multimedia stuff?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) install_multimedia=true; break;;
        No ) install_multimedia=false; break;;
    esac
done


sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo apt-get -y update
sudo apt-get -y install joe unity-tweak-tool xdotool

if [ -f chrome.sh ]; then
    echo "Installing Google Chrome"
    ./chrome.sh
fi

if $install_development; then
    sudo apt-get -y install vim git git-gui meld npm nodejs-legacy
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
fi

if $install_multimedia; then
    sudo apt-get -y install winff easytag audacity gimp vlc
fi

exit