@echo off

echo Installing Chocolatey
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

echo Installing choco packages
choco install -y atom googlechrome audacity git meld nodejs winff gimp vlc mp3tag

echo Installing npm packages
npm install -g bower gulp-cli ungit live-server nodemon
