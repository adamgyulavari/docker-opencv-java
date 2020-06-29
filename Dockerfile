FROM ubuntu:18.04

LABEL maintainer="Adam Gyulavari <gyulavari.adam@gmail.com>"

ENV LANG C.UTF-8

ENV OPENCV_VERSION 4.3.0

# RUN apt-get update -y
# RUN apt-get install -y software-properties-common
# RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libdc1394-22-dev

RUN apt-get install -y ant
RUN apt-get install -y openjdk-11-jdk
ARG JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
ENV JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
RUN apt-get install -y g++
RUN apt-get install -y wget
RUN apt-get install -y g++
RUN apt-get install -y unzip

RUN wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
RUN unzip ${OPENCV_VERSION}.zip -d /var/lib/
RUN mkdir /var/lib/opencv-${OPENCV_VERSION}/build
WORKDIR /var/lib/opencv-${OPENCV_VERSION}/build
RUN cmake -DBUILD_SHARED_LIBS=OFF -DOPENCV_JAVA_TARGET_VERSION=1.8 ..
RUN make -j2

RUN cp /var/lib/opencv-${OPENCV_VERSION}/build/lib/libopencv_java430.so /usr/lib

CMD /bin/sh
