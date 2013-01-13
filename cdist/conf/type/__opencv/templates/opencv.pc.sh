#!/bin/sh

cat << EOF
# Package Information for pkg-config

prefix=/usr/local
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir_old=\${prefix}/include/opencv
includedir_new=\${prefix}/include

Name: OpenCV
Description: Open Source Computer Vision Library
Version: ${version}
Libs:  -L\${libdir} -lopencv_calib3d -lopencv_contrib -lopencv_core -lopencv_features2d -lopencv_flann -lopencv_gpu -lopencv_highgui -lopencv_imgproc -lopencv_legacy -lopencv_ml -lopencv_nonfree -lopencv_objdetect -lopencv_photo -lopencv_stitching -lopencv_ts -lopencv_video -lopencv_videostab
Cflags: -I\${includedir_old} -I\${includedir_new}
EOF
