import RPi.GPIO as GPIO
from apscheduler.schedulers.background import BackgroundScheduler
from apscheduler.jobstores.sqlalchemy import SQLAlchemyJobStore 
from datetime import datetime, timedelta


# Brewer state machine
class Brewer:
	brew_relay = 11

	def __init__(self):
		self.state = "NOT_READY"

	def update(self, teapot, kettle):

		if self.state == "NOT_READY":
			if (kettle and teapot) == True:
				self.state = "READY"   

		elif self.state == "READY":
			if (kettle == False or teapot == False):
				self.state = "NOT_READY"

		elif self.state == "BREWING":
			if teapot == False:
				self.state = "NOT_READY"
			elif (kettle == False and teapot == True):
				self.state = "TEA_READY"
		elif self.state == "TEA_READY":
			if teapot == False:
				self.state = "NOT_READY"
		else:
			# catch any odd cases and reset the state machine
			self.state = "NOT_READY"
		# now update hardware to reflect new state
		if (self.state =="BREWING"):
			GPIO.output(self.brew_relay, GPIO.HIGH)
		else:
			GPIO.output(self.brew_relay, GPIO.LOW)


	def brew(self):
		print "Brew requested"	
		if self.state == "READY":
			self.state = "BREWING"
			return True
		else:
			return False

# Awakener state machine
class Awakener:

	def __init__(self):
		self.state = "ASLEEP"
		jobstore = {'default' : SQLAlchemyJobStore(url='sqlite:///jobs.sqlite')}
		self.scheduler = BackgroundScheduler(jobstores=jobstore)
		
		self.scheduler.start()
		self.schedule_brew(datetime.now()+timedelta(minutes=11))

	def update(self):
		pass
	
	def schedule_brew(self, ready_time):
		# define time it takes for the kettle to boil from cold
		brewing_time = timedelta(minutes=10)
		# calculate the time at which we should start brewing
		start_brewing_time = ready_time - brewing_time
		# schedule a brewing job so that the tea is ready when needed
		self.scheduler.add_job(my_brew.brew(), 'date', start_brewing_time)
		print "brew sheduled for "+start_brewing_time+" ready at "+ready_time
		
		
