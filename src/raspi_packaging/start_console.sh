sudo killall http-server
sudo killall pigpiod
sudo pigpiod -p 8888 -s 2
http-server /usr/local/ninjaqpcr/console/client/dist/ &
sudo node /usr/local/ninjaqpcr/console/server/server.js