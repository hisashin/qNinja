# This script stops wpa supplicants for connecting with Wi-Fi router and start access point mode.
date >>  /home/pi/ninjaqpcr/ap_mode.log
sudo killall wpa_supplicant
sudo ifconfig wlan0 down
sleep 3
sudo ifconfig wlan0 192.168.1.1 netmask 255.255.255.0 up
sleep 3
sudo /usr/sbin/dhcpd -cf /usr/local/ninjaqpcr/startup/conf/dhcpd.conf -lf /usr/local/ninjaqpcr/startup/log/lease.log &
sudo /usr/sbin/hostapd /usr/local/ninjaqpcr/startup/conf/hostapd.conf &
cd /usr/local/ninjaqpcr/network_conf_app
rm /home/pi/ninjaqpcr/user_data/boot_ap.dat
sudo node wifi_conf.js &

