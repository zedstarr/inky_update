#!/usr/bin/env python3

import os, sys
from PIL import Image
from inky.auto import auto


# Get the current path
PATH = os.path.dirname(__file__)

# Set up the Inky display
try:
    inky_display = auto(ask_user=True, verbose=True)
except TypeError:
    raise TypeError("You need to update the Inky library to >= v1.1.0")

try:
    inky_display.set_border(inky_display.BLACK)
except NotImplementedError:
    pass

# Pick the correct logo image to show depending on display resolution/colour

img = Image.open(os.path.join(PATH, "/home/pi/inky_update/MCLS-"+sys.argv[1]+".png"))

# Display the logo image

inky_display.set_image(img)
inky_display.show()

