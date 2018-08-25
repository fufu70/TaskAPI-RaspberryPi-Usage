#!/bin/bash

# setup directory to use the SHELL_HOME
SHELL_HOME=$1
TASK_API_URL=$2
DEFAULT_PASSWORD='raspberry'

. $SHELL_HOME/TaskAPI-RaspberryPi-Usage/scripts/helpers/export-functions.sh
