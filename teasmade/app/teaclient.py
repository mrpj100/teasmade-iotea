import socket
import os, os.path
import cPickle as pickle


class TeaClient:
	
	def kettle_status(self):
		client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)

		if os.path.exists("/tmp/tea_socket"):
			client.connect("/tmp/tea_socket")
			client.send('Kettle')
			reply = client.recv(1024)
			client.close()
			if reply == "0":
				reply = False
			else:
				 reply = True
			return reply

	def teapot_status(self):
		client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)

		if os.path.exists("/tmp/tea_socket"):
			client.connect("/tmp/tea_socket")
			client.send('Teapot')
			reply = client.recv(1024)
			client.close()
			if reply == "0":
				reply = False
			else:
				reply = True

			return reply

	def brewer_status(self):
		client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
		if os.path.exists("/tmp/tea_socket"):
			client.connect("/tmp/tea_socket")
			client.send("Brewer")
			reply = client.recv(1204)
			client.close()
			return reply
	
	def brew_now(self):
		client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
		if os.path.exists("/tmp/tea_socket"):
			client.connect("/tmp/tea_socket")
			client.send("BrewNow")
			reply = client.recv(1024)
			client.close()
			return reply

	def light_off(self):
		client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
		if os.path.exists("/tmp/tea_socket"):
			client.connect("/tmp/tea_socket")
			client.send("LightOff")
			reply = client.recv(1024)
			client.close()
			return reply
	
	def light_on(self):
                client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
                if os.path.exists("/tmp/tea_socket"):
                        client.connect("/tmp/tea_socket")
                        client.send("LightOn")
                        reply = client.recv(1024)
                        client.close()
                        return reply

	def light_sunrise(self):
                client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
                if os.path.exists("/tmp/tea_socket"):
                        client.connect("/tmp/tea_socket")
                        client.send("Sunrise")
                        reply = client.recv(1024)
                        client.close()
                        return reply

	def get_music_sources(self):
		client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
		if os.path.exists("/tmp/tea_socket"):
			client.connect("/tmp/tea_socket")
			client.send("MusicSources")
			sources_dict = pickle.loads(client.recv(2048))
			client.close()
			return sources_dict

	def music_stop(self):
		client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
		if os.path.exists("/tmp/tea_socket"):
			client.connect("/tmp/tea_socket")
			client.send("MusicStop")
			reply = client.recv(1024)
			client.close()
			return reply
	def music_play(self, new_source):
		client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
		if os.path.exists("/tmp/tea_socket"):
			client.connect("/tmp/tea_socket")
			pickled_source = pickle.dumps(new_source)
			client.send("MusicPlay"+pickled_source)
			reply = client.recv(1024)
			client.close()
			return reply

	def set_alarm(self, alarm_dict):
		client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
		if os.path.exists("/tmp/tea_socket"):
			client.connect("/tmp/tea_socket")
			pickled_alarm = pickle.dumps(alarm_dict)
			client.send("SetAlarm"+pickled_alarm)
			reply = client.recv(1024)
			client.close()
			return reply
