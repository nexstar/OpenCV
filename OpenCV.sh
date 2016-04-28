#! /bin/bash
#hello
sudo apt-get update
cd
mkdir _OpenCV
cd _OpenCV
sudo apt-get -y install vim git cmake automake

echo "*************Install the Dependencies*************"
sudo apt-get -y install libopencv-dev build-essential libdc1394-22-dev libjpeg-dev 
sudo apt-get -y install libgtk2.0-dev pkg-config python-dev python-numpy libdc1394-22
sudo apt-get -y install libpng12-dev libtiff4-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine-dev
sudo apt-get -y install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev
sudo apt-get -y install libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip

echo "*************Download OpenCV 3.0.0 alpha**********"

wget https://github.com/Itseez/opencv/archive/3.0.0-alpha.zip -O opencv-3.0.0-alpha.zip
unzip opencv-3.0.0-alpha.zip

echo "*************Install OpenCV***********************"

cd opencv-3.0.0-alpha
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j $(nproc)
sudo make install

echo "*************Finishing installation***************"

sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

echo "*************Running an OpenCV sample*************"

cd ..
cd samples
sudo cmake .
sudo make -j $(nproc)

echo "*************Running picture**********************"

cd cpp
./cpp-example-facedetect lena.jpg

