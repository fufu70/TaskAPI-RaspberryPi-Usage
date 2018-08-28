#!/bin/bash
# folder directory for the raspberry pi should be:
# 
#       intall   -> /home/pi/TaskAPI-RaspberryPi-Usage
#
# If this is not the case please flash your SD card again.

. /home/pi/TaskAPI-RaspberryPi-Usage/scripts/helpers/init-env.sh '/home/pi' 'localhost'

scripts=(init.sh node.sh cron.sh)
n_elements=${#scripts[@]}

for ((i = 0; i < $n_elements; i ++)); do
    start_script ${scripts[i]}
    . $SHELL_HOME/TaskAPI-RaspberryPi-Usage/scripts/${scripts[i]}
    end_script ${scripts[i]}
done

. $SHELL_HOME/TaskAPI-RaspberryPi-Usage/scripts/helpers/destroy-env.sh

echo $NODE_HASH_ID