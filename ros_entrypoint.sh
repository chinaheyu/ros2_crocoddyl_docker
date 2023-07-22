#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/$ROS_DISTRO/setup.bash" --
source "$OVERLAY_WS/install/setup.bash"
export PYTHONPATH=$PYTHONPATH:$OVERLAY_WS/install/crocoddyl/lib/python3/dist-packages:$OVERLAY_WS/install/example-robot-data/lib/python3/dist-packages
exec "$@"