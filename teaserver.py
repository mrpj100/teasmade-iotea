#! /usr/bin/python

import socket
import select
import os, os.path
import time
import RPi.GPIO as GPIO
import logging
import uuid
import cPickle as pickle
from apscheduler.schedulers.background import BackgroundScheduler
from apscheduler.jobstores.sqlalchemy import SQLAlchemyJobStore
from datetime import datetime, timedelta, date, time
#from teasmade_fsm import Brewer
import Brewer
import LightController
import MusicPlayer

# configuration

#define time it takes for the kettle to boil from cold
brewing_time = timedelta(minutes = 12)

#define start of sunrise time
sunrise_time = timedelta(minutes = 15)

def schedule_brew(ready_time):
	
        # calculate the time at which we should start brewing
        start_brewing_time = ready_time - brewing_time
        # schedule a brewing job so that the tea is ready when needed
        my_scheduler.add_job(Brewer.brew, 'date', run_date=start_brewing_time)
        print "brew scheduled for "+str(start_brewing_time)+" ready at "+str(ready_time)

# set_alarm takes a time in UTC and 'today', 'tomorrow' or a comma-separated string of weekday codes for repeating alarms: Mon,Tue,Wed,Thu,Fri,Sat,Sun

def set_alarm(brew=False, sunrise=False, music=True, music_source='Radio3',  day_of_week='tomorrow', hour=07, minute=00):
	# creates a new alarm by scheduling brewer and sunrise jobs
	# first, turn the awakening time into a python time
	awakening_time = timedelta(hours=hour, minutes=minute)
	print "awakening time = "+str(awakening_time)
	# now calculate the offset to start-of-brew
	start_brewing_time = awakening_time - brewing_time
	print "start brewing time = "+str(start_brewing_time)
	# ... and the offset to start-of-sunrise
	start_sunrise_time = awakening_time - sunrise_time
	
	# generate an alarm group unique ID
	group_id = str(uuid.uuid1())
	# add ID suffixes for subalarms
	brew_id = group_id+"-B"
	sunrise_id = group_id+"-S"
	music_id = group_id+"-M"
	
	# work out if we mean a one-off alarm for tomorrow, or a repeating one
	if (day_of_week == 'today' or day_of_week == 'tomorrow'):

	    # set one-off alarm

	    # calculate date for today or tomorrow
	    tomorrow_date = datetime.combine(date.today(),time(0,0,0))
       	    if (day_of_week == 'tomorrow'):
	    	tomorrow_date = tomorrow_date + timedelta(days=1)

	    # calculate when to trigger brewer
	    if brew == True:
            	start_brewing_datetime = tomorrow_date+start_brewing_time
	    	my_scheduler.add_job(Brewer.brew, trigger='date', run_date=start_brewing_datetime, id=brew_id)

	    # calculate when to trigger sunrise
	    if sunrise == True:
	    	start_sunrise_datetime = tomorrow_date+start_sunrise_time
	    	my_scheduler.add_job(LightController.sunrise , trigger='date', run_date=start_sunrise_datetime, id=sunrise_id)
	    # add awaken music
	    if music == True:
		    awaken_datetime = tomorrow_date+awakening_time
		    print "Music source ", music_source
		    my_scheduler.add_job(MusicPlayer.play_source, args = [music_source],  trigger='date', run_date=awaken_datetime, id=music_id)
	else:
	    # set repeating alarm
	    pass

# *** MAIN FUNCTION ***

# configure Python loggging
logging.basicConfig()

# configure GPIO
# use board GPIO numbers
GPIO.setmode(GPIO.BOARD) 

# output 11 is kettle relay
GPIO.setup(11, GPIO.OUT)

# input 7 is teapot switch
GPIO.setup(7, GPIO.IN)
# input 13 is kettle switch
GPIO.setup(13, GPIO.IN)
# input 15 is light switch
GPIO.setup(15, GPIO.IN)
# input 16 is tea now switch
GPIO.setup(16, GPIO.IN)

# configure socket server
if os.path.exists("/tmp/tea_socket"):
	os.remove( "/tmp/tea_socket")
print "Opening socket..."
server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
server.bind("/tmp/tea_socket")
os.chmod("/tmp/tea_socket", 666)
server.listen(1)

print "Listening..."


# initialise scheduler
# create jobstore
jobstore = {'default' : SQLAlchemyJobStore(url='sqlite:///jobs.sqlite')}
# set default job parameters
job_default_settings = {'misfire_grace_time' : 60} # sixty seconds misfire time


my_scheduler = BackgroundScheduler(jobstores=jobstore, job_defaults=job_default_settings)

# temporary clear of jobstore whilst debugging
my_scheduler.remove_all_jobs()

# show queued jobs
my_scheduler.print_jobs()

my_scheduler.start()
# test awaken
#test_alarm_time = datetime.now()
#test_alarm_time = test_alarm_time + timedelta(minutes=16)
#print "test alarm time = "+str(test_alarm_time)
#set_alarm(brew=True, sunrise=True, day_of_week='today', hour=test_alarm_time.hour, minute=test_alarm_time.minute)

#print "Alarm scheduled"
my_scheduler.print_jobs()

# initialise non-blocking socket reading list
read_list = [server]

# initialise serial comms to lighting module
LightController.initialise()

# Main loop - service requests from web front-end
while (True):

	# Grab the state of the input lines
	teapot = -(GPIO.input(7)-1)
	kettle = -(GPIO.input(13)-1)
	light = GPIO.input(15)
	teanow = GPIO.input(16)

	# process state machine updates
	Brewer.update(teapot, kettle, teanow)
	
	# process LightController updates (flush serial buffer, process hardware light switch)
	LightController.update(light)

	# Accept a socket connection request if there is one, otherwise carry on
	readable, writable, errored = select.select(read_list, [], [], 0.5)
	for s in readable:
		# handle the resulting list of sockets
		if s is server:
			connection, address = server.accept()
			read_list.append(connection)
		else:
			# case where we have data waiting from an existing connection
			datagram = s.recv( 1024)
			if  datagram:
				print "-" * 20
				print datagram
				if "DONE" == datagram:
					break
				if "Teapot" == datagram:
					print "Teapot status requested"
					s.send(str(teapot))
				if "Kettle" == datagram:
					print "Kettle status requested"
					s.send(str(kettle))
				if "Light" == datagram:
					print "Light switch status requested"
					s.send(str(light))
				if "TeaNow" == datagram:
					print "Tea now switch status requested"
					s.send(str(teanow))
				if "Brewer" == datagram:
					print "Brewer status requested"
					s.send(str(Brewer.state))
				if "BrewNow" == datagram:
					print "Brew now requested"
					brew_status = Brewer.brew()
					s.send(str(brew_status))
				if "LightOff" == datagram:
					print "Turning light off"
					LightController.off()
					s.send("OFF")
				if "LightOn" == datagram:
					print "Turning light on"
					LightController.on_remote()
					s.send("ON")
				if "Sunrise" == datagram:
					print "Beginning sunrise"
					LightController.sunrise()
					s.send("SUNRISE")
				if "MusicSources" == datagram:
					print "Music sources list requested"
					music_sources = MusicPlayer.list_sources()
					pickled_sources = pickle.dumps(music_sources)
					s.send(pickled_sources)
				if "MusicStop" == datagram:
					print "Music stop requested"
					MusicPlayer.stop()
					s.send("MUSICSTOP")
				if "MusicPlay" == datagram[0:9]:
					print "Music play requested"
					pickled_source = datagram[9:]
					new_source = pickle.loads(pickled_source)
					MusicPlayer.stop() # kill any existing music
					MusicPlayer.play_source(new_source)
					s.send("MUSICPLAY")		

				if "SetAlarm" == datagram[0:8]:
					print "Alarm set requested"
					pickled_alarm = datagram[8:] # grab rest of datagram
					alarm_dict = pickle.loads(pickled_alarm)

					print "selected music source", alarm_dict['music_source']

					set_alarm(day_of_week = alarm_dict['day_of_week'], hour = alarm_dict['hour'], minute = alarm_dict['minute'], music_source = alarm_dict['music_source'], sunrise = alarm_dict['sunrise'], brew = alarm_dict['brew'])
					my_scheduler.print_jobs()
					s.send("SETALARM")
 

				print "done processing"
			else:
				s.close()
				read_list.remove(s)


# End of main loop, only reached by breaking out
print "-" * 20
print "Shutting down..."
server.close()
os.remove("/tmp/tea_socket")
print "Done"
