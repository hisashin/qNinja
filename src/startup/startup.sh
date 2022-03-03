#!/bin/bash

date >> /home/pi/ninjaqpcr/startup.log
# Use GPIO11/CE1(SPI) (pin 24)
gpio mode 11 in
val=$(gpio read 11)

echo "NINJAQPCR_SRC=$NINJAQPCR_SRC"
echo "NINJAQPCR_DATA=$NINJAQPCR_DATA"
echo "NINJAQPCR_VERSION=$NINJAQPCR_VERSION"
echo "NINJAQPCR_USER_DATA=$NINJAQPCR_USER_DATA"
echo "NINJAQPCR_HOME=$NINJAQPCR_HOME"

AP_MODE_FILE=/home/pi/ninjaqpcr/user_data/boot_ap.dat
rm -f /home/pi/.cache/chromium/Default/Cache/*
if [ -f "$AP_MODE_FILE" ]; then
    touch /home/pi/ninjaqpcr/user_data/boot_ap_detected.dat
    sudo /usr/local/ninjaqpcr/startup/start_ap_mode.sh
else
    if iwgetid | grep -q 'wlan'; then
        echo 'WiFi Connected'
        sudo /usr/local/ninjaqpcr/startup/start_normal_mode.sh
    else
        echo 'WiFi not connected'
        sudo /usr/local/ninjaqpcr/startup/start_ap_mode.sh
    fi 
fi
exit 0

