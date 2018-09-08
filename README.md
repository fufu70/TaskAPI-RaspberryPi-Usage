# TaskAPI-RaspberryPi-Usage

Taken partially from the [raspberry-pi-cluster-install](https://github.com/fufu70/raspberry-pi-cluster-install) repo. This repo tries to install a script to constantly request a task if a current task is not being worked on.

## Usage
Personal installation process for setting up the task nodes after ssh'ing into the raspberry pi. `TASK_IP_ADDRESS` is a variable pointing to the current IP address of the [Task-API](https://github.com/fufu70/TaskAPI)
```bash
git clone https://github.com/fufu70/TaskAPI-RaspberryPi-Usage; cd TaskAPI-RaspberryPi-Usage; echo "TASK_API_URL=${TASK_IP_ADDRESS}" >> ~/.task_environment; sudo bash scripts/install.sh
```
## Note
If your running an older version of Raspbian, make sure to update your distro with `sudo apt-get dist-upgrade`. This will allow certain packages such as [`jq`](https://stedolan.github.io/jq/) and [`inxi`](https://github.com/smxi/inxi) to be installed.
