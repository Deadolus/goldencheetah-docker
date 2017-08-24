#!/bin/bash

echo "Checking out GoldenCheetah source"
git clone https://github.com/GoldenCheetah/GoldenCheetah.git

cd GoldenCheetah/
cp qwt/qwtconfig.pri.in qwt/qwtconfig.pri
cp src/gcconfig.pri.in src/gcconfig.pri
echo """
CONFIG += release
QMAKE_CXXFLAGS += -O3
QWT3D_INSTALL = /usr
QWT3D_INCLUDE = /usr/include/qwtplot3d
QWT3D_LIBS    = /usr/lib/libqwtplot3d-qt5.so
LIBZ_LIBS    = -lz
""" >> src/gcconfig.pri
cd ..

function checkForLibrary {
echo -n "Checking if $1 is installed..."
ldconfig -p | grep $1 > /dev/null
if [ $? -eq "1" ]; then
    echo "not installed... Trying to install it"
    sudo apt install $1
else
    echo "ok"
fi
}
checkForLibrary libqwtplot3d-qt5-0
checkForLibrary libqt5concurrent5   
checkForLibrary libqt5serialport5
checkForLibrary libqt5bluetooth5
checkForLibrary libqt5multimedia5
echo "Building docker"
docker build -t deadolus/goldencheetah .
