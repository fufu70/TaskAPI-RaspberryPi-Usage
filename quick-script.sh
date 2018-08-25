#!/bin/bash
# Quick script on using the TaskAPI from setting up the Node and its node moments to running the Task.

#install basics
sudo apt -y --force-yes install jq curl

#setup ENV
TASK_API_URL="localhost"

# 1.) Get the task
NODE_SYSTEM="$(inxi -S)"
NODE_CPU="$(inxi -C)"
NODE_HARD_DISK="$(inxi -p)"
NODE_RESULT=$(curl --data "system=${NODE_SYSTEM}&cpu=${NODE_CPU}&hard_disk=${NODE_HARD_DISK}" "${TASK_API_URL}/node/create")
NODE_HASH_ID=$(jq -r '.node_hash_id' <<<"$NODE_RESULT")

# 2.) Get Task from node
TASK_RESULT=$(curl --data "node_hash_id=${NODE_HASH_ID}" "${TASK_API_URL}/task/request")
TASK_HASH_ID=$(jq -r '.task_hash_id' <<<"$TASK_RESULT")
TASK_INSTALL_COMMAND=$(jq -r '.install_command' <<<"$TASK_RESULT")
TASK_START_COMMAND=$(jq -r '.start_command' <<<"$TASK_RESULT")
TASK_END_COMMAND=$(jq -r '.end_command' <<<"$TASK_RESULT")

# 3.) Run Task
eval $TASK_INSTALL_COMMAND
eval $TASK_START_COMMAND
eval $TASK_END_COMMAND

