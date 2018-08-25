#!/bin/bash

# install cron
sudo apt-get -y --force-yes install cron

# add test console command to the cron tab

crontab -l | { cat; echo "* * * * * sudo source /home/pi/TaskAPI-RaspberryPi-Usage/scripts/request-task.sh"; } | crontab -