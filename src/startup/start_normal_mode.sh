# Start Ninja-qPCR app
date >> /home/pi/ninjaqpcr/normal_mode.log
http-server -p 8080 /usr/local/ninjaqpcr/console/client/dist/ &
cd /usr/local/ninjaqpcr/console/server
/usr/local/ninjaqpcr/console/server/start_rpi.sh &
cd -