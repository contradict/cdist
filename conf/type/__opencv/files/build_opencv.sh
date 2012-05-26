#!/bin/bash
mkdir -p /usr/local/src
cd /usr/local/src
svn export -q http://code.opencv.org/svn/opencv/trunk opencv-svn
pushd opencv-svn/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D BUILD_PYTHON_SUPPORT=ON \
      -D WITH_TBB=ON \
      -D WITH_XINE=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D ENABLE_SSE=ON \
      -D ENABLE_SSE2=ON \
      -D ENABLE_SSE3=ON \
      -D ENABLE_SSE41=ON \
      -D ENABLE_SSSE3=ON \
      -D WITH_CUBLAS=ON \
	  -D WITH_GSTREAMER=OFF \
      ..
make -j8
make install
ldconfig
popd
# rm -rf opencv-svn
