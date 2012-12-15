#!/bin/sh
. /opt/ros/electric/setup.bash
ROS_PACKAGE_PATH=\
/opt/ros/opencv_overlay/image_transport_plugins:\
/opt/ros/opencv_overlay/image_pipeline:\
/opt/ros/opencv_overlay/vision_opencv:\
$ROS_PACKAGE_PATH
export ROS_PACKAGE_PATH
