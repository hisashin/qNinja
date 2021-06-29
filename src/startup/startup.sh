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

echo "$val"
if [ $val = 1 ]; then
  echo "GPIO0 HIGH (AP mode)"
  # sudo /usr/local/ninjaqpcr/startup/start_ap_mode.sh
  sudo /usr/local/ninjaqpcr/startup/start_normal_mode.sh
else
  echo "GPIO0 LOW (Normal mode)"
  sudo /usr/local/ninjaqpcr/startup/start_normal_mode.sh
fi
