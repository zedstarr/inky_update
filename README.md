# inky_update
A service for Raspberry Pi to update the pimoroni inky pHAT e-ink display with various Psion connectivity statuses

Monitoring 3 things - 1. internet connectivity 2. user logged in from Psion RS232/USB port and 3. Psion MCLINK.EXE DOS file-link running in Dosbox-s on the Pi

Effectively 3 bits - i.e. 8 possible combinations so I created 8 bitmaps to represent each possibility.

Only when a status change is detected is the display updated.

"inky-shutdown" service displays the Psion logo just before shutdown ensuring the Pi is Psion'd whislt it's off ;-) 


