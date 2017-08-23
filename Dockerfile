FROM ubuntu:17.04
MAINTAINER Simon Egli <goldencheetahgit_a4747d@egli.online>
#LABEL maintainer="Simon Egli <goldencheetahgit_a4747d@egli.online>"


LABEL description="A GoldenCheetah build environment"

#RUN apt-get update && apt-get install -y \
RUN apt-get update 
RUN apt-get install -y \
  gcc \
  clang \
  cmake \
  g++  \
  automake \
  autoconf \
  autoconf-archive \
  make \
  build-essential \
  qtbase5-dev qt5-default qt5-qmake qtbase5-dev-tools \
  libqt5svg5-dev libqt5serialport5-dev libqt5multimedia5 libqt5multimediawidgets5 libqt5webkit5-dev libqt5bluetooth5 qtmultimedia5-dev qtconnectivity5-dev qttools5-dev-tools \
  git-core \
  libftdi-dev \
  liboauth-dev \
  libqwtplot3d-qt5-dev \
  libkml-dev \
  flex \
  bison \
  libical-dev \
  libvlc-dev  \
  libusb-dev \
  libssl-dev
RUN ln -s /usr/lib/x86_64-linux-gnu/qt5/bin/lrelease /usr/lib/x86_64-linux-gnu/qt5/bin/lrelease-qt4
VOLUME ["/data"]

CMD ["/bin/bash"]

#Src directory needs some changes: 
#cp qwt/qwtconfig.pri.in qwt/qwtconfig.pri
#cp src/gcconfig.pri.in src/gcconfig.pri
#Then in src/gccconfig.pri
#CONFIG += release
#QMAKE_CXXFLAGS += -O3
#QWT3D_INSTALL = /usr
#QWT3D_INCLUDE = /usr/include/qwtplot3d
#QWT3D_LIBS    = $${QWT3D_INSTALL}/lib/libqwtplot3d-qt5.so
#LIBZ_LIBS    = -lz
#Finally execute
#qmake -recursive
#make

#Host needs libqt5multimedia5

