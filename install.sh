sudo cp /home/pi/printerconfigpositron/backupscript.sh /usr/bin/
sudo cp /home/pi/printerconfigpositron/backupscript-before.sh /usr/bin/
sudo cp /home/pi/printerconfigpositron/backupscript-after.sh /usr/bin/
sudo chmod +x /usr/bin/backupscript.sh
sudo chmod +x /usr/bin/backupscript-before.sh
sudo chmod +x /usr/bin/backupscript-after.sh
sudo mkdir /tmp/backups
sudo mkdir /tmp/backups/after
sudo mkdir /tmp/backups/before
sudo sh /usr/bin/backupscript.sh
sudo sh /usr/bin/backupscript-before.sh
sudo apt-get install mc -y
cd ~/klipper/
sudo cp "./scripts/klipper-mcu-start.sh" /etc/init.d/klipper_mcu
sudo update-rc.d klipper_mcu defaults
sudo usermod -a -G tty pi
sudo apt-get install gpiod
sudo systemctl disable hciuart.service
sudo systemctl disable bluetooth.service
sudo apt-get install -y python-smbus
sudo apt-get install -y i2c-tools
cd /home/pi/printerconfigpositron/positron-dev-klipper-configfiles/
sudo cp /home/pi/printerconfigpositron/positron-dev-klipper-configfiles/*  /home/pi/klipper_config/
sudo su
echo ' ' >> /boot/config.txt
echo '#-------------- positron custom settings -------------- ' >> /boot/config.txt
echo 'display_hdmi_rotate' >> /boot/config.txt
echo 'xinput set-prop ‘raspberrypi-ts’ ‘Coordinate Transformation Matrix’ 0 1 0 -1 0 1 0 0 1' >> /boot/config.txt
echo 'dtoverlay=pi3-miniuart-bt' >> /boot/config.txt
echo 'dtoverlay=disable-bt' >> /boot/config.txt
echo 'enable_uart=1' >> /boot/config.txt
echo 'dtoverlay=pwm,pin=12,func=4' >> /boot/config.txt
exit
sudo sh /usr/bin/backupscript-after.sh
sudo reboot now
