from flask import render_template, redirect
from app import app
from teaclient import TeaClient
from forms import TeaNowForm, LightChoiceForm, AlarmSetForm, MusicForm
import cPickle as pickle

global source_list

@app.route('/')
@app.route('/index')
def index():
	tc = TeaClient()
	teapot = tc.teapot_status()
	
	
	kettle = tc.kettle_status()
	
	brewer = tc.brewer_status()	
	return render_template("index.html", title='Status', teapot=teapot, kettle=kettle, brewer=brewer)

@app.route('/teanow', methods = ['GET', 'POST'])
def teanow():
	form = TeaNowForm()
	if form.validate_on_submit():
		# form is valid, make some tea!
		tc = TeaClient()
		tc.brew_now()
		return redirect('/index')
	return render_template('teanow.html', title='Tea Now?', form=form)

@app.route('/light', methods = ['GET', 'POST'])
def light():
	form = LightChoiceForm()
	
	if form.validate_on_submit():
		if("on" == form.radio.data):
			# turn the light on
			tc = TeaClient()
			tc.light_on()
		if("off" == form.radio.data):
			# turn the light off
			tc = TeaClient()
			tc.light_off()
		if("sunrise" == form.radio.data):
			# call sunrise routine
			tc = TeaClient()
			tc.light_sunrise()

		return redirect('/light')

	return render_template('light.html', title='Light control', form=form)

@app.route('/music', methods = ['GET', 'POST'])
def music():
	form = MusicForm()
	tc = TeaClient()
	
	source_list = tc.get_music_sources()
	form.music_select.choices = [(key, value) for key, value in source_list.iteritems()]

	form.music_select.choices.append( ('STOP', "Stop music"))

	if form.validate_on_submit():
		if form.music_select.data == 'STOP':
			tc.music_stop()
			return redirect('/index')
		else:
			tc.music_play(form.music_select.data)
			return redirect('/index')		

	return render_template('music.html', title='Music control', form=form)

@app.route('/alarm', methods = ['GET', 'POST'])
def setAlarm():
	global source_list
	form = AlarmSetForm()
	tc = TeaClient()

	# get the names of the music sources and set up the radio buttons
	source_list = tc.get_music_sources()
	form.music_select.choices = [(key, value) for key,value in source_list.iteritems()]

	# parameters for setting the alarm
	alarm_dict = {}
	alarm_dict['brew'] = False
	alarm_dict['sunrise'] = False
	alarm_dict['music'] = True
	alarm_dict['music_source'] = ''
	alarm_dict['day_of_week'] = 'tomorrow'
	alarm_dict['hour'] = 07
	alarm_dict['minute'] = 00
	

	# if form's been submitted and validates, then set the alarm
	if form.validate_on_submit():
		if "today" == form.day_select.data:
			alarm_dict['day_of_week'] = 'today'
		elif "tomorrow" == form.day_select.data:
			alarm_dict['day_of_week'] = 'tomorrow'
		
		alarm_dict['hour'] = form.alarm_hour.data
		alarm_dict['minute'] = form.alarm_minute.data
		alarm_dict['music_source'] = form.music_select.data
		alarm_dict['sunrise'] = form.sunrise_select.data
		alarm_dict['brew'] = form.brew_select.data

		tc.set_alarm(alarm_dict)

		return redirect('/index')
	
	# otherwise render page as normal
	return render_template('alarm.html', title='Alarm set', form=form, source_list=source_list)
	

@app.route('/coffee')
def error418():
	return render_template('418.html', title="I'm a teapot")

