#Making backup before setup
sudo rsync -avzh /home/pi/klipper /tmp/backups/before/
sudo rsync -avzh /home/pi/klipper_config /tmp/backups/before/
sudo rsync -avzh /home/pi/klipper_logs /tmp/backups/before/
sudo rsync -avzh /home/pi/klippy-env /tmp/backups/before/
sudo rsync -avzh /home/pi/fluidd /tmp/backups/before/
sudo rsync -avzh /home/pi/gcode_files /tmp/backups/before/
sudo rsync -avzh /home/pi/moonraker /tmp/backups/before/
sudo rsync -avzh /home/pi/moonraker-env /tmp/backups/before/
sudo rsync -avzh /boot /tmp/backups/before/
