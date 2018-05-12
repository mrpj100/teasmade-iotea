import socket
import os, os.path

print "Connecting..."
if os.path.exists ("/tmp/tea_socket"):
	client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
	client.connect("/tmp/tea_socket")
	print "Ready"
	while True:
	    	try:
      			x = raw_input( "> " )
	      		if "" != x:
     		   		print "SEND:", x
        			client.send( x )
				print "Sent, awaiting reply"
				reply = client.recv(1024)
				print "reply = ",reply
	   	     		if "DONE" == x:
	          			print "Shutting down."
	          			break
	    	except KeyboardInterrupt, k:
  	    		print "Shutting down."
			client.close()
else:
  print "Couldn't Connect!"
print "Done"
