# Base ROS image
ARG ROS_DISTRO=humble
FROM osrf/ros:${ROS_DISTRO}-desktop

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=${ROS_DISTRO}
ENV INSTALL_PATH=/root/interbotix_ws

# Ensure bash is used as the default shell
SHELL ["/bin/bash", "-c"]

# Install essential dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    software-properties-common \
    python3-pip \
    python3-rosdep \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy the installation script into the container
COPY script/xsarm_amd64_install.sh /root/xsarm_amd64_install.sh

# Make the script executable
RUN chmod +x /root/xsarm_amd64_install.sh

# Run the installation script with the specified ROS distribution
RUN /root/xsarm_amd64_install.sh -d ${ROS_DISTRO} -n -p $INSTALL_PATH

# Source ROS 2 setup in all shells
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /root/.bashrc
RUN echo "source ~/interbotix_ws/install/setup.bash" >> /root/.bashrc

# Set the working directory
WORKDIR /root/interbotix_ws

COPY docker/entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]

# Build the workspace (src is mounted via docker-compose)
RUN . /opt/ros/${ROS_DISTRO}/setup.bash && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -r -y && \
    colcon build

# Set the default command to start a bash shell
CMD ["bash"]

# # Base ROS image
# ARG ROS_DISTRO=humble
# FROM osrf/ros:${ROS_DISTRO}-desktop

# # Set environment variables
# ENV DEBIAN_FRONTEND=noninteractive
# ENV ROS_DISTRO=${ROS_DISTRO}
# ENV INSTALL_PATH=/root/interbotix_ws

# # Ensure bash is used as the default shell
# SHELL ["/bin/bash", "-c"]

# # Install essential dependencies
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     curl \
#     git \
#     software-properties-common \
#     python3-pip \
#     python3-rosdep \
#     build-essential \
#     && rm -rf /var/lib/apt/lists/*

# # Copy the installation script into the container
# COPY xsarm_amd64_install.sh /root/xsarm_amd64_install.sh

# # Make the script executable
# RUN chmod +x /root/xsarm_amd64_install.sh

# # Run the installation script with the specified ROS distribution
# # and set the installation path explicitly to ~/interbotix_ws using the -p flag
# RUN /root/xsarm_amd64_install.sh -d ${ROS_DISTRO} -n -p $INSTALL_PATH

# # Copy the user's src folder into the interbotix_ws/src directory
# COPY ./src $INSTALL_PATH/src

# # Build the workspace
# RUN . /opt/ros/${ROS_DISTRO}/setup.bash && \
#     cd $INSTALL_PATH && \
#     colcon build

# # Source ROS 2 setup in all shells
# RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /root/.bashrc
# RUN echo "source ~/interbotix_ws/install/setup.bash" >> /root/.bashrc

# # Set the default command to start a bash shell
# CMD ["bash"]