PTS_DEB_FILE=phoronix-test-suite_10.8.4_all.deb
PTS_DEB_URL=https://phoronix-test-suite.com/releases/repo/pts.debian/files/$PTS_DEB_FILE

sudo apt update
sudo apt install php-cli php-xml build-essential xterm p7zip-full nasm yasm libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libopencv-dev freeglut3-dev libssl-dev openssl build-essential php-cli php-xml build-essential autoconf mesa-utils vulkan-tools unzip apt-file

pip3 install meson

wget $PTS_DEB_URL
sudo dpkg -i $PTS_DEB_FILE

cp -r phoronix-custom-suites/* $HOME/.phoronix-test-suite/test-suites/local/
