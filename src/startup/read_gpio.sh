#!/bin/bash

# Use GPIO11/CE1(SPI) (pin 24)
gpio mode 11 in
val=$(gpio read 11)

echo "$val"
if [ $val = 1 ]; then
  echo "GPIO0 HIGH (AP mode)"
else
  echo "GPIO0 LOW (Normal mode)"
fi