#!/bin/bash

# Use GPIO11/CE1(SPI) (pin 24)
gpio mode 11 in
val=$(gpio read 11)

echo "$val"
if [ $val = 1 ]; then
  echo "GPIO0 HIGH (AP mode)"
  sudo /home/pi/ninjaqpcr/startup/start_ap_mode.sh
else
  echo "GPIO0 LOW (Normal mode)"
  sudo /home/pi/ninjaqpcr/startup/start_normal_mode.sh
fi