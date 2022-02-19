#Making backup before setup
sudo rsync -avzh /home/pi/klipper /tmp/backups/after
sudo rsync -avzh /home/pi/klipper_config /tmp/backups/after
sudo rsync -avzh /home/pi/klipper_logs /tmp/backups/after
sudo rsync -avzh /home/pi/klippy-env /tmp/backups/after
sudo rsync -avzh /home/pi/fluidd /tmp/backups/after
sudo rsync -avzh /home/pi/gcode_files /tmp/backups/after
sudo rsync -avzh /home/pi/moonraker /tmp/backups/after
sudo rsync -avzh /home/pi/moonraker-env /tmp/backups/after
sudo rsync -avzh /boot /tmp/backups/after
