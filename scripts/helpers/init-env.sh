#!/bin/bash

ENVIRONMENT_FILE_NAME='.task_environment'

SHELL_HOME=$1
TASK_API_URL=$2
DEFAULT_PASSWORD='raspberry'
# load local environment
eval $(cat $1/$ENVIRONMENT_FILE_NAME)

# if environment is not read setup local environment
if [ -z $SHELL_HOME ]; then
    # write to env file
    echo "SHELL_HOME=${SHELL_HOME}" >> $SHELL_HOME/$ENVIRONMENT_FILE_NAME
    echo "TASK_API_URL=${TASK_API_URL}" >> $SHELL_HOME/$ENVIRONMENT_FILE_NAME
    echo "DEFAULT_PASSWORD=${DEFAULT_PASSWORD}" >> $SHELL_HOME/$ENVIRONMENT_FILE_NAME
    echo "ENVIRONMENT_FILE_NAME=${ENVIRONMENT_FILE_NAME}" >> $SHELL_HOME/$ENVIRONMENT_FILE_NAME
    echo "HAS_TASK=false" >> $SHELL_HOME/$ENVIRONMENT_FILE_NAME
fi

. $SHELL_HOME/TaskAPI-RaspberryPi-Usage/scripts/helpers/export-functions.sh