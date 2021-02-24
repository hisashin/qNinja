sudo apt update
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt -y install nodejs hostapd wiringpi
sudo apt-get -y install libcap2-bin
sudo setcap cap_net_bind_service=+ep /usr/bin/node
sudo npm install --global http-server
