#!/bin/bash
# Saves the current node on to the TaskAPI and stores the node_hash_id locally.

if [ -z $NODE_HASH_ID]; then
    NODE_SYSTEM="$(inxi -S)"
    NODE_CPU="$(inxi -C)"
    NODE_HARD_DISK="$(inxi -p)"
    NODE_RESULT=$(curl --data "system=${NODE_SYSTEM}&cpu=${NODE_CPU}&hard_disk=${NODE_HARD_DISK}" "${TASK_API_URL}/node/create")
    NODE_HASH_ID=$(jq -r '.node_hash_id' <<<"$NODE_RESULT")
    echo "NODE_HASH_ID=${NODE_HASH_ID}" >> $SHELL_HOME/$ENVIRONMENT_FILE_NAME
else
    echo "NODE ALREADY SET"
fi