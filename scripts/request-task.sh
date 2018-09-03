#!/bin/bash
# Gets a task if its not currently working on it and then operates on it.
eval $(cat /home/pi/.task_environment)

if [ "$HAS_TASK" = false ]; then
    sed -i '/HAS_TASK/d' $SHELL_HOME/$ENVIRONMENT_FILE_NAME; echo "HAS_TASK=true" >> $SHELL_HOME/$ENVIRONMENT_FILE_NAME

    # request task
    TASK_RESULT=$(curl --data "node_hash_id=${NODE_HASH_ID}" "${TASK_API_URL}/task/request")
    TASK_HASH_ID=$(jq -r '.task_hash_id' <<<"$TASK_RESULT")
    sed -i '/TASK_HASH_ID/d' $SHELL_HOME/$ENVIRONMENT_FILE_NAME; echo "TASK_HASH_ID=${TASK_HASH_ID}" >> $SHELL_HOME/$ENVIRONMENT_FILE_NAME

    if [ $TASK_HASH_ID != null ]; then
        TASK_INSTALL_COMMAND=$(jq -r '.install_command' <<<"$TASK_RESULT")
        TASK_START_COMMAND=$(jq -r '.start_command' <<<"$TASK_RESULT")
        TASK_END_COMMAND=$(jq -r '.end_command' <<<"$TASK_RESULT")
        
        # Run Task
        eval $TASK_INSTALL_COMMAND
        eval $TASK_START_COMMAND
        eval $TASK_END_COMMAND
    fi
    
    sed -i '/TASK_HASH_ID/d' $SHELL_HOME/$ENVIRONMENT_FILE_NAME;
    sed -i '/HAS_TASK/d' $SHELL_HOME/$ENVIRONMENT_FILE_NAME; echo "HAS_TASK=false" >> $SHELL_HOME/$ENVIRONMENT_FILE_NAME
fi