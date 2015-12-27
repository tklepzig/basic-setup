echo "Install Chocolatey"
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install -y atom googlechrome audacity git.install meld nodejs.install winff gimp vlc mp3tag
npm install -g bower gulp-cli ungit live-server nodemon
