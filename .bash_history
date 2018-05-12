reboot
sudo reboot
sudo apt-get update sudo apt-get upgrade
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git libao-dev libssl-dev libcrypt-openssl-rsa-perl libio-socket-inet6-perl libwww-perl avahi-utils libmodule-build-perl 
git clone https://github.com/njh/perl-net-sdp.git perl-net-sdp cd perl-net-sdp perl Build.PL sudo ./Build sudo ./Build test sudo ./Build install cd ..
git clone https://github.com/njh/perl-net-sdp.git perl-net-sdp cd perl-net-sdp perl Build.PL sudo ./Build sudo ./Build test sudo ./Build install
git clone https://github.com/njh/perl-net-sdp.git perl-net-sdp cd perl-net-sdp perl Build.PL
git clone https://github.com/njh/perl-net-sdp.git perl-net-sdp
cd perl-net-sdp
perl Build.PL
sudo ./Build
sudo ./Build test
sudo ./Build install
cd ..
git clone https://github.com/hendrikw82/shairport.git
cd shairport
make
./shaiport.pl -a AirPi
./shairport.pl -a AirPi
make install
cd shairport
make install
sudo make install
cp shairport.init.sample /etc/init.d/shairport
sudo cp shairport.init.sample /etc/init.d/shairport
cd /etc/init.d
chmod a+x shairport
sudo chmod a+x shairport
update-rc.d shaiport defaults
update-rc.d shairport defaults
sudo update-rc.d shairport defaults
sudo nano shairport
amixer cset numid=3 1
sudo reboot
sudo nano etc/network/interfaces
ls
cd /etc
ls
sudo nano /etc/network/interfaces
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf 
shutdown -r now
sudo shutdown -r now
sudo nano /etc/network/interfaces
lusb
lsusb
sudo nano /etc/network/interfaces
lsusb
aplay -l
Alsamixer
speaker-test
alsamixer
speaker-test
alsamixer &
speaker-test
alsamixer
speaker-test
cd /etc/modprobe.d
sudo nano alsa-base.conf
sudo shutdown -r now
cd shairport
ls
more README.md
ls
nano shairport.init.sample
more INSTALL.md
cd /etc/init.d
sudo nano shairport
amixer cset numid=3 0
amixer -c 0 cset numid=3 0
amixer -c 0 cset numid=3 1
amixer cset numid=3 1
alsamixer
sound-test
test-sound
speaker-test
alsamixer
Alsamixer
alsamixer
sudo nano alsa-base.conf
cd etc/modprobe.d
cd /etc/modprobe.d
sudo nano alsa-base.conf
lsusb
su shutdown -r now
exit
alsamixer
speaker-test
exit
sudo apt-get update
ping 192.168.178.1
ping www.google.com
ping fritz.box
route -n
sudo dhclient -r
sudo dhclient
route -n
sudo apt-get update
apt-get upgrade
sudo apt-get upgrade
exit
sudo nano /etc/network/interfaces
shutdown -r now
sudo shutdown -r now
sudo ifconfig
exit
sudo ifconfig
tracert google.com
traceroute google.com
traceroute fritz.box
ping 192.168.178.255
ping -b 192.168.178.255
sudo ifconfig
shutdown -r now
sudo shutdown -r now
exit
lsusb
aplay -l
alsamixer
speaker-test -c 2
pacman
sudo apt-get alsa-utils alsa-firmware alsa-plugins
apt-get help
apt-get help | more
sudo apt-get install alsa-utils alsa-firmware alsa-plugins
lsmod
alsamixer
speaker-test
speaker-test -c 2 -D sysdefault:CARD=Device
cd /etc/modprobe.d
sudo nano alsa-base.conf
cd ~
ls
cd shairport
cd /etc/init.d
sudo nano shairport
shairport --help
shutdown -r now
sudo shutdown -r now
sudo apt-get install pulseaudio pulseaudio-module-zeroconf
alsamixer
sudo shutdown -r now
alsamixer
./shairport
ls
top
ps
ps -aux
ps -aux | grep shairport
exit
su shutdown -h now
sudo shutdown -h now
sudo apt-get update
sudo apt-get upgrade
python
nano /etc/modprobe.d/raspi-blacklist.conf 
sudo nano /etc/modprobe.d/raspi-blacklist.conf 
sudo reboot
sudo apt-get install python-dev
mkdir python-spi
cd python-spi/
wget https://raw.github.com/doceme/py-spidev/master/setup.py
https://raw.github.com/doceme/py-spidev/master/spidev_module.c
wget https://raw.github.com/doceme/py-spidev/master/spidev_module.c
sudo python setup.py install
python
exit
ls
cd python-spi
ls
cd build
ls
wget http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git\;a=blob_plain\;f=Documentation/spi/spidev_test.c -O spidev_test
cd ~
wget http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git\;a=blob_plain\;f=Documentation/spi/spidev_test.c -O spidev_test
ls
gcc spidev_test
nano spidev_test
mv spidev_test spidev_test.c
gcc spidev_test.c
ls
sudo ./a.out
sudo modprobe spi_bcm2708
sudo echo "spi_bcm2708" >> "/etc/modules"
cd /dev
ls
cd /etc/
ls
sudo nano modules
cd ~
sudo ./a.out
ls
nano spidev_test.c 
ls /dev/
ls
nano spidev_test.c 
gcc spidev_test.c 
sudo ./a.out
sudo echo "KERNEL==\"spidev0\.[0-9]*\", GROUP=\"spi\"" >>  /etc/udev/rules.d/10-local.rules
cd /etc/udev/rules.d
ls
sudo nano 10-local.rules
sudo groupadd spi
usermod -a -G spi pi
su usermod -a -G spi pi
sudo usermod -a -G spi pi
exit
./a.out
sudo ./a.out
usermod
shutdown -r now
sudo shutdown -r now
cd /dev
ls
cd ~
./a.out
cd /etc/udev/rules.d
ls
sudo nano 40-scratch.rules
sudo nano 10-local.rules 
udevtest /dev/spidev0.1
cd ~
./a.out
udevtrigger
shutdown -r now
sudo shutdown -r now
./a.out
userinfo
cd /etc/group
cd /etc
sudo nano group
cd udev
ls
sudo nano udev.conf
fg
cd rules.d/
ls
sudo nano 99-input.rules 
sudo nano 10-local.rules 
cd ~
./a.out
shutdown -r now
sudo shutdown -r now
ls
./a.out
ls
cd python-spi
ls
nano setup.py
./setup.py
sudo setup.py
sudo ./setup.py
sudo python setup.py
sudo python ./setup.py
ls
cd ..
ls
git
git clone https://github.com/mstaflex/SPI-Py
ls
cd SPI-Py
python setup.py build
python setup.py install
sudo python setup.py install
python
pydoc spi
python
cd ..
ls
nano spidev_test.c 
sudo shutdown -h now
nano shiftbrite.py
ls
cd SPI-Py
ls
nano spidev_test.c 
python
cd ..
ls
nano shiftbrite.py
exit
nano shiftbrite.py
python shiftbrite.py
nano shiftbrite.py
python shiftbrite.py
nano shiftbrite.py
python shiftbrite.py
nano shiftbrite.py
python shiftbrite.py
python
sudo shutdown -h now
python
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
nano shiftbrite.py 
python shiftbrite.py
exit
fg
exit
aplay -l
speaker-test
Alsamixer
alsamixer
speaker-test
alsamixer
speaker-test
python shiftbrite.py
ls
cd shairport
ls
cd /etc/init.d
sudo nano shairport
shutdown -h now
sudo shutdown -h now
ls
python shiftbrite.py
nano spidev_test.c
python
ls
sudo apt-get update
python
sudo python
shutdown -h now
sudo shutdown -h now
sudo python
nano shiftbrite.py
python shiftbrite.py 
sudo shutdown -h now
python shiftbrite.py 
sudo shutdown -h now
sudo alsamixer
sudo alsactl store
sudo speaker-test
sudo nano shairport
ls
cd shairport
cd /etc/init.d
ls shairport
sudo nano shairport
update-rc.d shairport defaults
sudo update-rc.d shairport defaults
sudo shutdown -r now
cd shairport
ls
./shairport.pl - a AirPi
cd ..
git clone https://github.com/hendrikw82/shairport.git
cd shariport
cd shairport
git update
git --help
rm -rf *
ls
cd ..
git clone https://github.com/hendrikw82/shairport.git
rmdir shairport
rm -rf shairport
ls
git clone https://github.com/hendrikw82/shairport.git
cd shairport
make
./shairport.pl -a AirPi
sudo shutdown -h now
cd shairport
make install
sudo make install
./shairport - a 'airpi'
sudo /etc/init.d/shairport start
sudo shutdown -r now
python ./teaclient.py
nano teaclient.py
python ./teaclient.py
nano teaclient.py
python ./teaclient.py
nano teaclient.py
python ./teaclient.py
sudo chmod a+rw /tmp/tea_socket
python ./teaclient.py
sudo chmod a+rw /tmp/tea_socket
python ./teaclient.py
nano teaclient.py
python ./teaclient.py
nano teaclient.py
python ./teaclient.py
nano teaclient.py
python ./teaclient.py
nano teaclient.py
python ./teaclient.py
nano teaclient.py
exit
sudo apt-get update
sudo apt-get upgradee
sudo apt-get upgrade
sudo apt-get apache2
sudo apt-get install apache2
sudo leafpad /usr/lib/cgi-bin/hello.cgi &
sudo nano /usr/lib/cgi-bin/hello.cgi &
sudo nano /usr/lib/cgi-bin/hello.cgi
sudo chmod +x /usr/lib/cgi-bin/hello.cgi
sudo nano /etc/apache2/sites-enabled/000-default 
sudo service apache2 reload
sudo nano /etc/apache2/sites-enabled/000-default 
sudo service apache2 reload
sudo nano /usr/lib/cgi-bin/hello.py
sudo chmod +x /usr/lib/cgi-bin/hello.py
ls
python ./testinputs.py
sudo python ./testinputs.py
nano testinputs.py 
sudo python ./testinputs.py
nano testinputs.py 
sudo python ./teaserver.py
nano testinputs.py 
nano teaserver.py
sudo python ./teaserver.py
nano teaserver.py
sudo python ./teaserver.py
nano teaserver.py
sudo python ./teaserver.py
ps
ps -a
sudo rm /tmp/tea_socket
sudo python ./teaserver.py
nano teaserver.py
sudo python ./teaserver.py
nano teaclient.py
sudo python ./teaserver.py
nano teaserver.py
sudo python ./teaserver.py
nano teaserver.py
sudo python ./teaserver.py
nano teaserver.py
sudo python ./teaserver.py
nano teaserver.py
sudo python ./teaserver.py
nano teaserver.py
sudo python ./teaserver.py
nano teaserver.py
sudo python ./teaserver.py
nano teaserver.py
sudo python ./teaserver.py
exit
fg
exit
python teaclient.py
nano teaserver.py
python teaclient.py
nano teaclient.py
python teaclient.py
nano teaclient.py
python teaclient.py
nano teaclient.py
nano teaserver.py
python teaclient.py
nano teaclient.py
cat /dev/teasocket
nano teaclient.py
cat /tmp/teasocket
nano teaclient.py
cat /tmp/tea_socket
nano teaclient.py
python teaclient.py
pip
python pip
python install flask==0.9
python
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install flask==0.9
ls
nano teaserver.py
nano teaclient.py
python teaserver.py
sudo python teaserver.py
nano teaserver.py
sudo python teaserver.py
nano teaserver.py
sudo python teaserver.py
nano teaserver.py
sudo python teaserver.py
nano teasmade_fsm.py
cd teasmade/app
ls
nano teaclient.py
nano views.py
cd templates
nano index.html
cd ..
nano teaclient.py
nano views.py
sudo shutdown -h now
cd teasmade
ls
./run.py
nano teaserver.py
ls
pip install flask-wtf
sudo pip install flask-wtf
ls
cd teasmade
ls
cd app
ls
nano __init__.py
cd ..
nano config.py
cd app
nano __init__.py
cd teasmade
ls
cd app
ls
nano teaclient.py
cd templates
ls
cp teapot-418-sm.jpg ../static/
ls
sudo teaserver.py
ls
sudo ./python teaserver.py
sudo python teaserver.py
nano teaserver.py
nano teasmade_fsm.py
nano teaserver.py
sudo python teaserver.py
nano teaserver.py
nano teasmade_fsm.py
sudo python teaserver.py
nano teasmade_fsm.py
sudo python teaserver.py
nano teaserver.py
nano teasmade_fsm.py
nano teaserver.py
nano teasmade_fsm.py
sudo python teaserver.py
nano teasmade_fsm.py
sudo python teaserver.py
nano teasmade_fsm.py
sudo python teaserver.py
nano teasmade_fsm.py
sudo python teaserver.py
nano teasmade_fsm.py
sudo python teaserver.py
cd teasmade
ls
run.py
./run.py
cd teasmade
cd app
nano forms.py
cd templates
ls
nano teanow.html
cd ..
nano views.py
cd templates
nano base.html 
cd ..
nano views.py
cd templates
ls
nano base.html
nano 418.html
nano teanow.html
cd ..
nano views.py
cd templates
nano 418.html
nano teasmade_fsm.py
nano teaserver.py
exit
sudo python teaserver.py
cd teasmade
ls
cd ..
cd teasmade ./run.py
./run.py
nano teasamde_fsm.py
ls
nano teasmade_fsm.py
ls
nano teaserver.py
ls
nano shiftbrite.py
sudo shiftbrite.py
sudo ./shiftbrite.py
sudo python shiftbrite.py
nano shiftbrite.py
sudo shutdown -h now
ls
sudo python shiftbrite.py
sudo shutdown -h now
nano shiftbrite.py
sudo shutdown -h now
ls
nano shiftbrite.py
sudo python shiftbrite.py
nano teasserver.py
nano teaserver.py
nano shiftbrite.py
sudo python shiftbrite.py
nano shiftbrite.py
nano teaserver.py
nano shiftbrite.py
sudo python shiftbrite.py
sudo shutdown -h now
nano shiftbrite.py
sudo python shiftbrite.py
nano shiftbrite.py
sudo python shiftbrite.py
nano shiftbrite.py
sudo python shiftbrite.py
nano shiftbrite.py
sudo python shiftbrite.py
nano shiftbrite.py
sudo python shiftbrite.py
nano shiftbrite.py
sudo python shiftbrite.py
nano shiftbrite.py
sudo python shiftbrite.py
ls
././.
./shiftbrite.py
sudo ./shiftbrite.py
ls
sudo python shiftbrite.py 
nano shiftbrite.py
sudo python shiftbrite.py 
sudo 
sudo shutdown -h now
ls
sudo ./rpi_shiftbrite.py 
sudo shutdown -h now
sudo ./rpi_shiftbrite.py 
sudo shutdown -h now
ls
./rpi_shiftbrite.py 
sudo ./rpi_shiftbrite.py
sudo shutdown -h now
apt-get update
sudo apt-get update
sudo apt-get install build-essential python-dev git scons swig
git clone https://github.com/jgarff/rpi_ws281x.git
cd rpi_ws281x
scons
cd python
sudo python setup.py install
ls
cd examples
ls
nano strandtest.py 
sudo python strandtest.py
nano strandtest.py 
sudo nano strandtest.py
sudo python strandtest.py
sudo shutdown -h now
ls
cd rpi_ws281x/
ls
cd ..
ls
cd python
cd rpi_ws281x/
cd python
ls
cd examples/
ls
sudo python strandtest.py 
cd ..
ls
cd ..
ls
cd ..
ls
nano rpi_shiftbrite.py 
nano neopixel_sunrise.py
sudo python neopixel_sunrise.py 
cd rpi_ws281x/
cd python
cd examples/
ls
sudo python strandtest.py 
nano strandtest.py 
sudo python strandtest.py 
sudo shutdown -h now
ls
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
sudo shutdown -h now
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
ls
cd rpi_ws281x/
ls
cd python/
ls
cd examples/
ls
nano strandtest.py 
sudo python strandtest.py 
nano strandtest.py 
sudo python strandtest.py 
nano strandtest.py 
sudo python strandtest.py 
cd ~
ls
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
nano neopixel_sunrise.py 
sudo python neopixel_sunrise.py 
sudo shutdown -h now
ls
cd rpi_ws281x/
ls
cd python/
ls
cd examples/
ls
sudo ./strandtest.py
sudo python ./strandtest.py
cd ~
ls
sudo python ./neopixel_sunrise.py 
sudo shutdown -h now
ls
cd rpi_ws281x/
ls
cd python/
ls
cd examples/
ls
sudo python strandtest.py
shutdown -h now
sudo shutdown -h now
sudo raspi-config
sudo shutdown -r now
screen /dev/ttyAMA0 9600
y
screen /dev/ttyAMA0 9600
sudo shutdown -h now
cd teasmade/app
ls
cd templates
ls
nano index.html
nano base.html
nano teanow.html
cd ..
ls
nano forms.py
nano views.py
nano forms.py
nano views.py
cd templates/
ls
nano teanow.html
nano light.html
cd ..
nano views.py
nano forms.py
nano views.py
cd ~
cd teasmade/
ls
cd app/
ls
nano teaclient.py
cd ~
nano teaserver.py 
cd teasmade/app/
ls
nano views.py
cd templates/
ls
nano light.html 
cd ..
ls
nano views.py
cd templates
ls
nano base.html
nano light.html
cd ..
ls
nano forms.py
nano views.py
cd templates
ls
nano light.html
cd ..
nano forms.py
nano views.py
nano forms.py
nano views.py
nano teaclient.py
screen /dev/ttyAMA0 9600
ps
screen -x
ls
cd teasmade
ls
cd ..
ls
nano teaserver.py
nano Brewer.py
cd teasmade
ls
cd app
ls
cd ..
ls
nano run.py
cd app
ls
nano __init__.py
nano forms.py
nano views.py
nano teaclient.py
cd ..
ls
nano teasmade_fsm.py
sudo apt-get python-serial
sudo apt-get install python-serial
nano teaserver.py
cd teasmade
ls
cd app
ls
nano teaclient
nano teaclient.py
nano forms.py
nano views.py
cd static
ls
cd ..
ls
cd templates
ls
nano index.html
nano teanow.html
cd ../../..
ls
cd teasmade/
ls
./run.py
cd app
ls
nano teaclient.py
cd ../..
cd teasmade/
./run.py 
ls
python ./teaserver.py
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
screen /dev/ttyAMA0 9600
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
sudo python ./teaserver.py
nano teaserver.py 
nano Brewer.py
sudo python ./teaserver.py
python
pip install uuid
sudo pip install uuid
python
ls
nano Brewer.py
date
nano Brewer.py
python teaserver.py
sudo python teaserver.py
ls
cd teasmade
ls
python ./run.py
ls
nano lightcontroller.py
nano LightController.py
cd teasmadde
cd teasmade/
ls
cd ..
ls
nano neopixel_sunrise.py 
nano testinputs.py
python ./testinputs.py
nano Brewer.py
nano teaclient.py
nano teaserver.py
nano teaclient.py
nano testinputs.py 
sudo shutdown -h now
ls
sudo python ./testinputs.py
sudo shutdown -h now
flask run
ls
cd teasmade
ls
nano run.py
./run.py
ls
nano LightController.py
python ./teaserver.py
sudo python ./teaserver.py
sudo shutdown -h now
sudo python ./teaserver.py
sudo shutdown -h now
sudo python teaserver.py
ls
nano Brewer.py
sudo python teaserver.py
nano Brewer.py
sudo python teaserver.py
nano Brewer.py
sudo python teaserver.py
sudo shutdown -h now
cd teasmade
./run.py 
sudo python teaclient.py
ls
sudo python teaclient.py
nano teaclient.py
sudo python teaserver.py
nano teaserver.py
sudo shutdown -h now
ls
cd teasmade
run.py
./run.py
sudo python teaserver.py
nano teaserver.py
sudo python teaserver.py
nano teaserver.py
sudo python teaserver.py
lsusb
sudo apt-get update
sudo apt-get upgrade
sudo shutdown -r now
lsusb
dmesg | grep usb
sudo nano /etc/modprobe.d/alsa-base.conf
sudo reboot
speaker-test -c2
sudo apt-get install mpg123
mpg123 http://ice1.somafm.com/u80s-128-mp3
aplay -l
speaker-test -c2 --test=wav -w /usr/share/sounds/alsa/Front_Center.wav
mpg123 --help
man mpg123
alsmamixer
alsamixer
sudo usermod -a -G audio pi
mpg123 --list-modules
mpg123 -o alsa http://voxsc1.somafm.com:8882/
mpg123 -o alsa http://ice1.somafm.com/u80s-128-mp3
speaker-test --help
mpg123 -v -o alsa http://ice1.somafm.com/u80s-128-mp3
man aplay
aplay -l
sudo mpg123 -v -o alsa http://ice1.somafm.com/u80s-128-mp3
alsamixer
sudo mpg123 -v -o alsa http://ice1.somafm.com/u80s-128-mp3
mpg123 -o alsa http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio3_mf_p?s=1525247790&e=1525262190&h=791fcafc63bb4f1310faa3f2e8e165f8
mpg123 -v -o alsa http://ice1.somafm.com/u80s-128-mp3
sudo mpg123 -o alsa http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio3_mf_p?s=1525247790&e=1525262190&h=791fcafc63bb4f1310faa3f2e8e165f8
sudo mpg123 -v -o alsa http://ice1.somafm.com/u80s-128-mp3
sudo reboot
sudo mpg123 -v -o alsa http://ice1.somafm.com/u80s-128-mp3
sudo mpg123 -o alsa http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio3_mf_p?s=1525247790&e=1525262190&h=791fcafc63bb4f1310faa3f2e8e165f8
ps
ps -aux
pskill mpg123
kill 2860
sudo kill 2860
ps -aux ¬ grep mpg123
ps -aux | grep mpg123
ps aux | grep mpg123
mpg123 -o alsa http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio3_mf_p?s=1525247790&e=1525262190&h=
ps aux | grep mpg123

sudo mpg123 -o alsa http://lstn.to/CLA

sudo mpg123 -o alsa -@ http://lsn.to/CLA
sudo mpg123 -o alsa -@ http://media-ice.musicradio.com/ClassicFMMP3.m3u
nano LightController.py
nano MusicPlayer.py
locate mpg123
whereis mpg123
sudo /usr/bin/mpg123 -@ http://www.radiofeeds.co.uk/bbcradio3.pls
nano MusicPlayer.py
sudo /usr/bin/mpg123 -@ http://www.radiofeeds.co.uk/bbcradio3.pls
exit
nano teaserver.py
ls
nano Brewer.py
nano MusicPlayer.py
nano teaserver.py
sudo teaserver.py
sudo ./teaserver.py
ls
sudo python teaserver.py
nano MusicPlayer.py 
sudo python teaserver.py
nano MusicPlayer.py 
sudo python teaserver.py
nano teaserver.py
sudo python teaserver.py
nano teaserver.py
sudo python teaserver.py
nano teaserver.py
sudo python teaserver.py
nano teaserver.py
sudo python teaserver.py
nano teaserver.py
sudo mpg123 -@ http://www.radiofeeds.co.uk/bbcradio3.pls
sudo python teaserver.py
sudo mpg123 -@ http://www.radiofeeds.co.uk/bbcradio3.pls
sudo python teaserver.py
whereis sudo
sudo python teaserver.py
nano teaserver.py
exit
sudo shutdown -h now
alsamixer
nano teaserver.py
nano LightController.py
sudo python teaserver.py
nano LightController.py
nano Brewer.py
nano teaserver.py
nano Brewer.py
nano teaserver.py
nano Brewer.py
sudo python teaserver.py
cd teasmade
ls
cd app
ls
nano teaclient.py
nano forms.py
nano views.py
cd ~
nano MusicPlayer.py
sudo python teaserver.py
cd teasmade
cd static
ls
cd app/static/
ls
cd ..
ls
nano forms.py
cd templates
ls
nano light.html
ls
nano base.html
cd ..
ls
nano forms.py
nano views.py
nano teaclient.py
nano views.py
cd ~
sudo python teaserver.py
nano teaserver.py
cd teasmade/app/
ls
nano forms.py
cd templates/
ls
nano alarm.html
cd ..
./run.py
cd app
ls
nano forms.py
cd ..
./run.py
sudo python teaserver.py
sudo shutdown -h now
clear
cd teasmade
ls
cd app
ls
nano views.py
cd templates
nano music.html
ls
nano base.html
cd ..
nano forms.py
nano views.py
clear
cd teasmade
ls
cd app
ls
cd templates
ls
nano alarm.html
cd ..
ls
nano teaserver.py
cd teasmade/app/
nano teaclient.py
cd ~
nano teaserver.py
cd teasmade/app
nano teaclient.py
CD ~
nano teaserver.py
cd ~
nano teaserver.py
cd teasmade
./run.py
cd teasmade/app
ls
nano forms.py
cd ..
ls
nano MusicPlayer.py
cd teasmade/app/
ls
nano forms.py
cd ..
ls
cd app
ls
nano teaclient.py
nano forms.py
cd ~
nano MusicPlayer.py
cd teasmade/app
nano teaclient.py
ls
nano forms.py
cd templates
ls
nano alarm.html
cd ~
ls
cd teasmade/app/
ls
nano forms.py
nano views.py
cd tempaltes
nano music.html
cd templates/
nano music.html 
cd ~
nano MusicPlayer.py
cd teasmade/app/
nano teaclient.py
