#!/bin/sh

BUILD_DIR="$(pwd)/ta-lib-src"
SRC_DIR="$(pwd)/c_src"
PRIV_DIR="$(pwd)/priv"

yes | apt-get update
yes | apt-get install gcc build-essential

wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz

tar -zxvf ta-lib-0.4.0-src.tar.gz

rm ta-lib-0.4.0-src.tar.gz

cd ta-lib
mkdir $BUILD_DIR
# ./configure --prefix=$BUILD_DIR
# make
# make install
# mv $BUILD_DIR/lib/*  $PRIV_DIR
# mv $BUILD_DIR/include/ta-lib/*  $SRC_DIR
