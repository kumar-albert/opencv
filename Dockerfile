FROM debian:latest

COPY . /opencv

RUN apt-get update && apt-get install build-essential -y

RUN apt-get -y update && apt-get install -y git cmake python3-pip python3-dev python3-tk vim procps curl

RUN pip3 install numpy==1.12.1 opencv-python==3.2.0.6

RUN apt-get install -y cmake git python-dev python-numpy libgtk2.0-dev pkg-config libavcodec-dev

RUN apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
			libcanberra-gtk-module libcanberra-gtk3-module

RUN apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev \
	libtiff-dev libdc1394-22-dev

RUN mkdir -p  /opencv/build && cd /opencv/build && \
	cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. && \
	make -j4 && make install



