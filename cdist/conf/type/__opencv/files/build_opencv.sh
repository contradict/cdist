#!/bin/bash
version=$1
mkdir -p /usr/local/src
cd /usr/local/src
wget -q http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/${version}/OpenCV-${version}.tar.bz2
tar -xjf OpenCV-${version}.tar.bz2
pushd OpenCV-${version}
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D WITH_TBB=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D ENABLE_SSSE3=ON \
      -D ENABLE_SSE41=ON \
      -D ENABLE_SSE42=ON \
      -D ENABLE_AVX=ON \
      ..
make -j8
make install
ldconfig
popd
# rm -rf OpenCV-${version}.tar.bz2
# rm -rf OpenCV-${version}
