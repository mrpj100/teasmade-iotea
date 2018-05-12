import serial

global light_port

global light_status

def initialise():
	global light_port
	global light_status
	# open serial port
	light_port = serial.Serial("/dev/ttyAMA0", baudrate=9600, timeout=0.5)
	# turn off light at initialisation
	light_port.write("\nOFF\n")
	light_status = 'OFF' 

def update(lightswitch = False):
	global light_port
	global light_status
	# called in main loop to do any continuous updating
	# just flush input buffer here
	light_port.flushInput()
	# read hardware switch and control light

	if light_status != 'ON':
	   if lightswitch == True:
		on()
		print "Light Switch turned on"

	if light_status == 'ON':
	   if lightswitch == False:
		off()
		print "Light Switch turned off"

def off():
	global light_status
	light_port.write("OFF\n")
	light_status = 'OFF'
	print "Light turned off"

def on():
	global light_status
	light_port.write("WARMWHITE\n")
	light_status = 'ON'
	print "Light turned on"

# call this function to turn the light on from a remote control - otherwise the lack of LIGHT ON switch logic will immediately switch it off!
def on_remote():
	global light_status
	light_port.write("WARMWHITE\n")
	light_status = 'ON_REMOTE'
	print "Light turned on"


def sunrise():
	global light_status
	print "Sunrise requested\n"
	light_port.write("SUNRISE\n")
	light_status = 'SUNRISE'
