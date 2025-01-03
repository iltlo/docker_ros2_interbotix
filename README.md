# ROS2 Humble Docker Setup

This repository contains the Docker setup for running ROS 2 Humble with [Interbotix workspace](https://docs.trossenrobotics.com/interbotix_xsarms_docs/ros_interface/ros2/software_setup.html). It includes the necessary Dockerfile and docker-compose.yml to build and run the environment.

## Prerequisites
- Docker
- Docker Compose

## Setup Instructions

1. **Build and run the Docker container:**
    ```sh
    docker-compose up --build -d
    ```

2. **Access the container:**
    ```sh
    docker exec -it humble_container bash
    ```

<!-- ## USB Device Support
Ensure correct device paths in `docker-compose.yml`:
```yaml
devices:
  - "/dev/tty.usbmodemXXXX:/dev/ttyUSB0"
  - "/dev/tty.usbmodemYYYY:/dev/ttyUSB1" -->