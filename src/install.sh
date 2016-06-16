#!/bin/bash

DEST_DIR=/usr/include/liberaCommon
LIB_FILE=libliberacommon.s

#Create dir
mkdir $DEST_DIR

#Copy header files to dir
cp -rf ./*.h $DEST_DIR

#copy lib to path


#update symlink
ln -f