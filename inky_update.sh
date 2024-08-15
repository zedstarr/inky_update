#!/bin/bash

echo 0 > /home/pi/inky_update/status.txt

while true; do 

  PREV_STATE=$(cat /home/pi/inky_update/status.txt)
  PSI_STAT_M="0"
  PSI_STAT_T="0"
  PSI_STAT_I="0"
  SERVICE="MCLINK.EXE"
  ps -ef | grep $SERVICE | grep -v grep > /dev/null
  if [ $? -eq 0 ]
  then
      PSI_STAT_M="1"
  else
      PSI_STAT_M="0"
  fi
  
  # test if user is logged in via tty/USB
  w | grep ttyUSB | grep -v grep > /dev/null
  if [ $? -eq 0 ]
  then
    PSI_STAT_T="1"
  else
    PSI_STAT_T="0"
  fi

  #  test if connected to internet
  if ping -q -c 1 -W 1 google.com >/dev/null 2>&1
  then
    PSI_STAT_I="1"
  else
    PSI_STAT_I="0"
  fi

  PSI_STATUS=$((2#$PSI_STAT_I$PSI_STAT_T$PSI_STAT_M))
  echo $PSI_STATUS > /home/pi/inky_update/status.txt

  if [ "$PSI_STATUS" != "$PREV_STATE" ]; then
 
    # display bitmap MCLS-x.png where x is the status bitmap number 0-7
    /usr/bin/python3 /home/pi/inky_update/inky_display.py $PSI_STATUS > /dev/null 2>&1
    echo "`date`: "$PREV_STATE" "$PSI_STATUS >> /home/pi/inky_update/states.txt
  fi

  sleep 77

done
