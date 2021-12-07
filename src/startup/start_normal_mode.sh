# Start Ninja-qPCR app
date >> /home/pi/ninjaqpcr/normal_mode.log
sudo killall http-server
sudo killall pigpiod
sudo pigpiod -p 8888 -s 2
http-server -p 8080 /usr/local/ninjaqpcr/console/client/dist/ &
cd /usr/local/ninjaqpcr/console/server
/usr/local/ninjaqpcr/console/server/start_rpi.sh &
cd -