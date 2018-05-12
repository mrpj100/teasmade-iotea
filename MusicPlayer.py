import subprocess

awaken_music_sources = {
	'Radio3' : 'http://www.radiofeeds.co.uk/bbcradio3.pls',
	'Radio4' : 'http://www.radiofeeds.co.uk/bbcradio4fm.pls',
	'ClassicFM' : 'http://media-ice.musicradio.com/ClassicFMMP3.m3u',
	'WorldService' : 'http://wsdownload.bbc.co.uk/worldservice/meta/live/shoutcast/mp3/eieuk.pls'

}

awaken_music_names = {
	'Radio3' : 'BBC Radio 3',
        'Radio4' : 'BBC Radio 4 FM',
        'ClassicFM' : 'Classic FM',
        'WorldService' : 'BBC World Service'
}

global music_source
music_source = 'Radio3'

def initialise():
	null

def update():
	null

def stop():
	subprocess.call(['killall' , 'mpg123'])

def select_source(chosen_source):
	global music_source
	if chosen_source in awaken_music_sources:
		music_source = chosen_source
	else:
		print "invalid music source"	
def play():
	global music_source
	play_command = '/usr/bin/sudo /usr/bin/mpg123 -@ '+ awaken_music_sources[music_source]
	print "play command", play_command
	subprocess.Popen(play_command, shell=True)

def play_source(chosen_source):
	select_source(chosen_source)
	play()

def list_sources():
	return awaken_music_names

def current_source():
	return music_source


