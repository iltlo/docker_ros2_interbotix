#!/bin/bash

# Source ROS 2
source /opt/ros/${ROS_DISTRO}/setup.bash
echo "Sourced ROS 2 ${ROS_DISTRO}"

# Source the workspace, if built
if [ -f /root/interbotix_ws/install/setup.bash ]; then
  source /root/interbotix_ws/install/setup.bash
  echo "Sourced Interbotix workspace"
fi

# Merge local src into the container's src folder
# cp -r /root/interbotix_ws/src_local/* /root/interbotix_ws/src/ || true

# Default to bash if no command is passed
if [ -z "$1" ]; then
  echo "No command passed. Starting bash..."
  exec bash
else
  echo "Executing command: $@"
  exec "$@"
fi
