#!/bin/bash

# update the machine
sudo apt -y --force-yes update

# Update and install essential 
sudo apt-get -y --force-yes install build-essential manpages-dev 

#install vim ... cause why not
sudo apt -y --force-yes install vim nmap

#install git for getting necessary packages
sudo apt -y --force-yes install git 

#install curl for requesting information from the TaskAPI and JQ to parse the JSON objects
sudo apt -y --force-yes install curl jq