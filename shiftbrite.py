import spi
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)

GPIO.setup(18, GPIO.OUT)
GPIO.setup(22, GPIO.OUT)

GPIO.output(18, GPIO.LOW)
GPIO.output(22, GPIO.LOW)

red = 255
blue = 0
green = 0


def write_to_shiftbrite(redval, greenval, blueval, controlbyte):


	tx_bytes = []

	tx_bytes.append(((controlbyte<<6) & 255 ) | (blueval>>4))
	tx_bytes.append(((blueval<<4) & 255) | redval>>6)
	tx_bytes.append(((redval<<2) & 255) | greenval>>8)
	tx_bytes.append(greenval & 255)

	print tx_bytes
	#GPIO.output(18, GPIO.HIGH) # ensure falling edge for SPI

	s = spi.openSPI(speed=10000)

	GPIO.output(18, GPIO.LOW)

	print spi.transfer(tuple(tx_bytes+tx_bytes+tx_bytes+tx_bytes+tx_bytes))

	spi.closeSPI()

	GPIO.output(18, GPIO.HIGH)
	GPIO.output(18, GPIO.LOW) # latch registers


# main code here

write_to_shiftbrite(red, green, blue, 0)
#write_to_shiftbrite(120, 100, 100, 2)


