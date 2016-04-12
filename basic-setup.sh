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
sudo apt-get -y install vim joe unity-tweak-tool xdotool gparted


echo "Configuring .bashrc"

if [ ! -f ~/.bashrc ]
then
    touch ~/.bashrc
fi

if ! grep -q "~/.custom-config" ~/.bashrc
then
    echo "if [ -f ~/.custom-config ]; then . ~/.custom-config; fi" >> ~/.bashrc;
fi
rm -f ~/.custom-config
echo "alias mkcd='function __mkcd() { mkdir \"\$1\"; cd \"\$1\"; unset -f __mkcd; }; __mkcd'" >> ~/.custom-config
echo "alias git='LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 git'" >> ~/.custom-config
echo "alias g='git'" >> ~/.custom-config
echo "alias gk='LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 gitk --all &'" >> ~/.custom-config
echo "alias gg='LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 git gui &'" >> ~/.custom-config
echo "alias a='atom .'" >> ~/.custom-config
echo "#show current branch and possible staged or unstaged changes in bash prompt" >> ~/.custom-config
echo "export GIT_PS1_SHOWDIRTYSTATE=1" >> ~/.custom-config
echo "export PS1='\u@\h:\[\033[0;33m\]\w\[\033[01;32m\]\$(__git_ps1)\[\033[00m\]\n\\$ '" >> ~/.custom-config
echo "export PROMPT_DIRTRIM=4" >> ~/.custom-config
echo "shopt -s extglob" >> ~/.custom-config

if [ -f chrome.sh ]; then
    echo "Installing Google Chrome"
    ./chrome.sh
fi

if $install_development; then
    sudo apt-get -y install git git-gui meld kdiff3 npm nodejs-legacy

    #install latest version of git
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install git

    #install latest version of node
    curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
    sudo apt-get install -y nodejs

    sudo npm install -g bower gulp-cli grunt-cli ungit live-server nodemon node-inspector livedown mocha

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
