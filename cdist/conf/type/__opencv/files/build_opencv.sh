#!/bin/bash
version=$1
umask 0022
mkdir -p /usr/local/src
cd /usr/local/src
wget -q
http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/${version}/opencv-${version}.zip
rm -rf opencv-${version}
unzip opencv-${version}.zip
chgrp -R users opencv-${version}
chmod g+rX opencv-${version}
pushd opencv-${version}
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
      -D BUILD_EXAMPLES=ON \
      ..
make -j8
make install
ldconfig
popd
# rm -rf opencv-${version}.tar.bz2
# rm -rf opencv-${version}
