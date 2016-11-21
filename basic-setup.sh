#!/bin/bash

setupcon

install_development=false;
install_multimedia=false;

accent='\033[4;1;1;33m'
normal='\033[0m'

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


sudo add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo apt-get -y update
sudo apt-get -y install vim joe unity-tweak-tool xdotool gparted sshfs

if [ -f chrome.sh ]; then
    echo -e "${accent}Installing Google Chrome${normal}"
    ./chrome.sh
fi

if $install_development; then
    sudo apt-get -y install git git-gui meld kdiff3 npm nodejs-legacy

    #install latest version of git
    sudo add-apt-repository -y ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get -y install git
    
    sudo npm install -g bower gulp-cli grunt-cli ungit live-server nodemon node-inspector livedown mocha azure-cli qckwinsvc http-server

    if [ -f atom/atom.sh ]; then
        echo -e "${accent}Installing Atom${normal}"
        atom/atom.sh
    fi

    if [ -f atom/atom-packages ]; then
        echo -e "${accent}Installing atom packages${normal}"
        apm install --packages-file atom/atom-packages
    fi
fi

if $install_multimedia; then
    sudo apt-get -y install winff easytag audacity gimp vlc
fi

if [ -f bash-git.sh ]; then
    echo -e "${accent}Configure bash and git${normal}"
    ./bash-git.sh
fi

exit
