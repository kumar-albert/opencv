####################################################
# Using debian base, Opencv package build from git. 
####################################################

FROM debian:latest

MAINTAINER Kumar Albert

COPY . /opencv

RUN apt-get update && apt-get install build-essential -y

RUN apt-get install -y cmake python-dev python-numpy libgtk2.0-dev pkg-config libavcodec-dev

RUN apt-get install -y libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
			libcanberra-gtk-module libcanberra-gtk3-module

RUN apt-get install -y python3-pip python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev \
	libtiff-dev libdc1394-22-dev

RUN pip3 install numpy==1.12.1 opencv-python==3.2.0.6

RUN mkdir -p  /opencv/build && cd /opencv/build && \
	cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. && \
	make -j4 && make install && rm -rf /opencv

RUN apt-get purge cmake* git* -y



