#!/bin/bash

# install cron
sudo apt-get -y --force-yes install cron

# add test console command to the cron tab

sudo crontab -l | { cat; echo "* * * * * bash /home/pi/TaskAPI-RaspberryPi-Usage/scripts/request-task.sh"; } | sudo crontab -
sudo crontab -l | { cat; echo "* * * * * bash /home/pi/TaskAPI-RaspberryPi-Usage/scripts/save-node-moment.sh"; } | sudo crontab -