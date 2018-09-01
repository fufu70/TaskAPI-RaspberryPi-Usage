#!/bin/bash
# Saves current moment of the node to the TaskAPI
eval $(cat $SHELL_HOME/$ENVIRONMENT_FILE_NAME)

if [ -n "$NODE_HASH_ID" ]; then
    NODE_CPU_USAGE="$(inxi -t c)"
    NODE_MEMORY_USAGE="$(inxi -t m)"
    NODE_HARD_DISK_USAGE="$(inxi -p)"
    NODE_TEMPERATURE="$(inxi -s)"
    NODE_WEATHER="$(inxi -w)"
    NODE_MOMENT_RESULT=$(curl --data "node_hash_id=${NODE_HASH_ID}&cpu_usage=${NODE_CPU_USAGE}&memory_usage=${NODE_MEMORY_USAGE}&hard_disk_usage=${NODE_HARD_DISK_USAGE}&temperature=${NODE_TEMPERATURE}&weather=${NODE_WEATHER}" "${TASK_API_URL}/NodeMoment/create")
fi