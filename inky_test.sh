#!/bin/bash

for i in {0..7}; do

  /usr/bin/python3 /home/pi/inky_update/inky_display.py $i
  sleep 10

done
