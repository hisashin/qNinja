# This script stops wpa supplicants for connecting with Wi-Fi router and start access point mode.
date >> /home/pi/ninjaqpcr/startup/log/ap_mode.log
sudo killall wpa_supplicant
sudo ifconfig wlan0 down
sleep 3
sudo ifconfig wlan0 192.168.1.1 netmask 255.255.255.0 up
sleep 3
sudo /usr/sbin/dhcpd -cf /home/pi/ninjaqpcr/startup/conf/dhcpd.conf -lf /home/pi/ninjaqpcr/startup/log/lease.log &
sudo /usr/sbin/hostapd /home/pi/ninjaqpcr/startup/conf/hostapd.conf &
cd /home/pi/ninjaqpcr/network_conf_app
sudo node wifi_conf.js &