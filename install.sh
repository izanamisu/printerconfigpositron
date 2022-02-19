sudo apt-get update
#sudo apt-get upgrade -y 
#sudo apt-get dist-upgrade -y
sudo apt-get install git -y
sudo apt-get install mc -y
cd ~/klipper/
sudo cp "./scripts/klipper-mcu-start.sh" /etc/init.d/klipper_mcu
sudo update-rc.d klipper_mcu defaults
sudo usermod -a -G tty pi
sudo apt-get install gpiod
sudo systemctl disable hciuart.service
sudo systemctl disable bluetooth.service
fuser /dev/ttyAMA0
sudo apt-get install -y python-smbus
sudo apt-get install -y i2c-tools
git clone https://github.com/buyapi/ups.git
cd ups
cd scripts
sudo cp ups.sh /usr/bin/
sudo chmod +x /usr/bin/ups.sh
sudo usermod -a -G tty pi
git clone https://github.com/julianschill/klipper-led_effect.git
cd klipper-led_effect
./install-led_effect.sh
cd rpi_ws281x/
sudo python neopixelring.py
sudo python /home/pi/klipper_config/ws2812-controll.py
sudo python /home/pi/ws2812-controll.py
sudo apt autoremove
cd /home/pi/
git clone https://github.com/izanamisu/printerconfigpositron.git
cd /home/pi/printerconfigpositron/positron-dev-klipper-configfiles/
sudo cp /home/pi/printerconfigpositron/positron-dev-klipper-configfiles/*  /home/pi/klipper_config/
sudo su
echo ' ' >> /boot/config.txt
echo '#-------------- positron custom settings -------------- ' >> /boot/config.txt
echo 'dtoverlay=pi3-miniuart-bt' >> /boot/config.txt
echo 'dtoverlay=disable-bt' >> /boot/config.txt
echo 'enable_uart=1' >> /boot/config.txt
echo 'dtoverlay=pwm,pin=12,func=4' >> /boot/config.txt
echo ' ' >> /etc/dhcpcd.conf
echo 'interface wlan0' >> /etc/dhcpcd.conf
echo 'static ip_address=192.168.192.53/24' >> /etc/dhcpcd.conf
echo 'static routers=192.168.192.1' >> /etc/dhcpcd.conf
echo 'static domain_name_servers=192.168.192.1' >> /etc/dhcpcd.conf
exit
make clean
