FROM ros:foxy

ENV OVERLAY_WS=/opt/ros/overlay_ws

# Clone the crocoddyl repository and its dependencies.
WORKDIR $OVERLAY_WS/src
RUN apt-get update && \
    apt-get install -y git && \
    git clone --recursive https://github.com/loco-3d/crocoddyl.git && \
    git clone --recursive https://github.com/Gepetto/example-robot-data.git && \
    rm -rf /var/lib/apt/lists/*

# Install build dependencies and add support for matplotlib.
WORKDIR $OVERLAY_WS
ENV MPLBACKEND=tkagg
RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    apt-get update && \
    apt-get install -y graphviz python3-pip python3-pil python3-pil.imagetk python3-tk && \
    pip3 install meshcat matplotlib==3.5 && \
    rosdep install --from-paths src --ignore-src -r -y && \
    rosdep install --from-paths /opt/ros/$ROS_DISTRO/share/pinocchio --ignore-src -r -y && \
    rm -rf /var/lib/apt/lists/*

# Compiled the crocoddyl package under ros workspace.
RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build --mixin "release"

# Update the entry point to source the workspace.
COPY ros_entrypoint.sh /ros_entrypoint.sh
