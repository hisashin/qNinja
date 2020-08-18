#!/bin/bash

gpio mode 0 in
val=$(gpio read 0)

echo "$val"
if [ $val = 1 ]; then
  echo "GPIO0 HIGH (AP mode)"
else
  echo "GPIO0 LOW (Normal mode)"
fi