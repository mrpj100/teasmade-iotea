#! /usr/bin/python

import RPi.GPIO as GPIO

# use board GPIO numbers
GPIO.setmode(GPIO.BOARD) 

# output 11 is kettle relay
#GPIO.setup(11, GPIO.OUT)

# input 12 is teapot switch
GPIO.setup(12, GPIO.IN)
# input 13 is kettle switch
GPIO.setup(13, GPIO.IN)
# input 15 is light switch
GPIO.setup(15, GPIO.IN)
# input 16 is tea now switch
GPIO.setup(16, GPIO.IN)

while (True):
	teapot = GPIO.input(12)
	kettle = GPIO.input(13)
	light = GPIO.input(15)
	teanow = GPIO.input(16)
	print teapot, kettle, light, teanow

