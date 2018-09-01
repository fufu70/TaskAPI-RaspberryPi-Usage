#!/bin/bash

# install cron
sudo apt-get -y --force-yes install cron

# add test console command to the cron tab

crontab -l | { cat; echo "* * * * * source /home/pi/TaskAPI-RaspberryPi-Usage/scripts/request-task.sh"; } | crontab -
crontab -l | { cat; echo "* * * * * source /home/pi/TaskAPI-RaspberryPi-Usage/scripts/save-node-moment.sh"; } | crontab -