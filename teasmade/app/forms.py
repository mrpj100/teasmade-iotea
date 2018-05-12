from flask.ext.wtf import Form
from wtforms import RadioField, SubmitField, BooleanField, IntegerField

class TeaNowForm(Form):
	pass

class LightChoiceForm(Form):
	radio = RadioField(choices=[("on", "On"), ("off", "Off"), ("sunrise", "Sunrise")])

class AlarmSetForm(Form):
	day_select = RadioField(choices=[("tomorrow", "Tomorrow") , ("today", "Today")], default="tomorrow")
	alarm_hour = IntegerField(default = "7")
	alarm_minute = IntegerField(default = "00")
	music_select = RadioField(choices=[("radio3", "BBC Radio 3")])
	sunrise_select = BooleanField(default = "checked")
	brew_select = BooleanField(default = "checked")

class MusicForm(Form):
	music_select = RadioField(choices=[("radio3", "BBC Radio 3")])
