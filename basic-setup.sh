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
sudo apt-get -y install vim joe unity-tweak-tool xdotool gparted sshfs tmux

echo -e "${accent}Installing Google Chrome${normal}"
curl -Ls https://raw.githubusercontent.com/tklepzig/basic-setup/master/chrome.sh | bash

if $install_development; then
    sudo apt-get -y install git git-gui meld kdiff3 npm nodejs-legacy

    #install latest version of git
    sudo add-apt-repository -y ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get -y install git
    
    sudo npm install -g ungit live-server nodemon node-inspector livedown mocha azure-cli http-server yarn
fi

if $install_multimedia; then
    sudo apt-get -y install winff easytag audacity gimp vlc
fi

echo -e "${accent}Configure bash and git${normal}"
curl -Ls https://raw.githubusercontent.com/tklepzig/basic-setup/master/bash-git.sh | bash

exit
