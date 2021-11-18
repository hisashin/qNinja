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
    touch /home/pi/ninjaqpcr/user_data/boot_ap_notfound.dat
    sudo /usr/local/ninjaqpcr/startup/start_normal_mode.sh
fi
exit 0

echo "$val"
if [ $val = 1 ]; then
  echo "GPIO0 HIGH (AP mode)"
  # sudo /usr/local/ninjaqpcr/startup/start_ap_mode.sh
  sudo /usr/local/ninjaqpcr/startup/start_normal_mode.sh
else
  echo "GPIO0 LOW (Normal mode)"
  sudo /usr/local/ninjaqpcr/startup/start_normal_mode.sh
fi
