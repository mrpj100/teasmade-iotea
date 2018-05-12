#!/usr/bin/env python
"""A simple/readable example of driving a Shiftbrite / Octobar / Allegro A6281 
via  hardware SPI on the Raspberry Pi.

You must have /dev/spidev* devices / bcm2708_spi driver for this to work.
"""

import fcntl, array, RPi.GPIO as GPIO
import time

### Configuration ###

# set to the number of modules you are controlling.  If this is  a shiftbrite,
#it would be 1, if it's an octobar, 8, etc

NUM_LEDS = 5  

#In addition to the hardware SPI pins, we require two general GPIO pins for 
#the enable and latch pins.  It doesn't matter what pins you use

ENABLE_PIN = 22
LATCH_PIN  = 18

def pack_color(red, green, blue):
    """Takes 10 bits of each color (0-1023) and packs it into the four bytes
    needed by the LED controller

    Ported from: http://docs.macetech.com/doku.php/shiftbrite#code_example
    """
    rv = bytearray(4)

    #2bit control, 6bit blue
    rv[0] = (0b00 << 6) & 0b11111111 | blue >> 4

    #4bit blue, 4 bit red
    rv[1] = (blue << 4) & 0b11111111 | red >> 6

    #6bit red, 2 bit green
    rv[2] = (red  << 2) & 0b11111111 | green >> 8

    #8bits green
    rv[3] = green & 0b11111111

    return rv

def update_leds(bytes):
    """Just write the byte array out to the SPI device and toggle the latch"""
    #write the shit out over SPI
    spidev.write(bytes)
    spidev.flush()

    #latch, #rpi is slow enough we don't need a delay here
    GPIO.output(LATCH_PIN, 1)
    GPIO.output(LATCH_PIN, 0)

    #toggle enable pin to see if that helps
    GPIO.output(ENABLE_PIN, 1)
    GPIO.output(ENABLE_PIN, 0)


def set_led(num, red, green, blue):
    """helper function to quickly set an LED color

    Don't use this in production code, global is bad mmmkay?
    """

    global leds

    leds[num*4:(num*4)+4] = pack_color(red, green, blue)


if __name__ == "__main__":
    #open the SPI device for writing
    spidev = file("/dev/spidev0.0", "wb")

    #set the speed of the SPI bus, 5000000 == 5mhz    
    #Magic number below is from spidev.h SPI_IOC_WR_MAX_SPEED_HZ
    #TODO: can I reference this as a constant from termios?
    fcntl.ioctl(spidev, 0x40046b04, array.array('L', [5000000]))

    #setup our GPIO
    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BOARD)
    GPIO.setup(ENABLE_PIN, GPIO.OUT)
    GPIO.setup(LATCH_PIN, GPIO.OUT)

    #both pins low to start
    GPIO.output(LATCH_PIN, 0)
    GPIO.output(ENABLE_PIN, 0)

    #setup the initial LED state as a byte array of 4 bytes per module
    leds = bytearray(4 * NUM_LEDS)

    #set leds to red / green / blue 
    set_led(0, 1023, 0, 0)
    set_led(1, 0, 1023, 0)
    set_led(2, 0, 0, 1023)    

    set_led(3, 1023, 0, 0)
    set_led(4, 0, 1023, 0)
    #set_led(5, 0, 0, 1023)    

    #set_led(6, 1023, 0, 0)
    #set_led(7, 0, 1023, 0)

    #write the data to the strip    
    update_leds(leds)
    time.sleep(10)

    brightness=0
    increment=10
    while True:
     set_led(0, brightness, brightness, brightness)
     set_led(1, brightness, brightness, brightness)
     set_led(2, brightness, brightness, brightness)
     set_led(3, brightness, brightness, brightness)
     set_led(4, brightness, brightness, brightness)
     update_leds(leds)
     time.sleep(1)
     print ("brightness = ", brightness)
     brightness = brightness + increment
     if (brightness >= 254):
      brightness=254
      increment=-10
     if (brightness <= -1):
      brightness=0
      increment=+10

	

#    spidev.close()
