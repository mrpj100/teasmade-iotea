import RPi.GPIO as GPIO


# Brewer state machine
brew_relay = 11

global state
state = "NOT_READY"

global manual_brewing
manual_brewing = False

#todo implement "cancel teanow brew" - needs an extra variable and some more logic

def update(teapot, kettle, teanow):
	global state
	global manual_brewing

	if state == "NOT_READY":
		if (kettle and teapot) == True:
			state = "READY"
			manual_brewing = False   

	elif state == "READY":
		if (kettle == False or teapot == False):
			state = "NOT_READY"
		if (teanow == True): # if the tea now switch has been pressed, make tea now
			manual_brewing = True
			brew();

	elif state == "BREWING":
		if manual_brewing == True and teanow == False:
			state = "NOT_READY" # cancel brewing if teanow switch is switched off
			manual_brewing = False
			print "Manual brew cancelled"
		elif teapot == False:
			state = "NOT_READY"
		elif (kettle == False and teapot == True):
			state = "TEA_READY"
	elif state == "TEA_READY":
		manual_brewing = False
		if teapot == False:
			state = "NOT_READY"
	else:
		# catch any odd cases and reset the state machine
		state = "NOT_READY"
	# now update hardware to reflect new state
	if (state =="BREWING"):
		GPIO.output(brew_relay, GPIO.HIGH)
	else:
		GPIO.output(brew_relay, GPIO.LOW)


def brew():
	global state
	print "Brew requested"	
	if state == "READY":
		state = "BREWING"
		return True
	else:
		print "Brew request failed"
		print "Brew state", state
		return False

		
