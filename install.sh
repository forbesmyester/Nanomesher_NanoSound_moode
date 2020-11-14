#!/bin/bash

sudo pip install python-mpd2

sudo cp nanosound_lirc.service /lib/systemd/system/
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable nanosound_lirc
sudo /bin/systemctl start nanosound_lirc

sudo mkdir -p /var/www
sudo wget https://raw.githubusercontent.com/moode-player/moode/develop/www/vol.sh -O /var/www/vol.sh
sudo chmod +x /var/www/vol.sh
sudo mkdir -p /var/local/www/db/
sudo rm /var/local/www/db/moode-sqlite3.db
sudo sqlite3 /var/local/www/db/moode-sqlite3.db 'create table cfg_system (id int, value int)'
sudo sqlite3 /var/local/www/db/moode-sqlite3.db 'insert into cfg_system (id, value) values (33, 0), (32, 100), (137, 100)'
sudo chmod uog+rwx /var/local/www/db/moode-sqlite3.db
sudo /var/www/vol.sh mute
sudo /var/www/vol.sh up 20

