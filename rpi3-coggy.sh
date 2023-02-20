#!/bin/bash

# scp -O ./rpi3-coggy.sh root@$RPI_IP:rpi3-coggy.sh

# sh rpi3-coggy.sh

echo Enter RPI IP: 
read $ip
export RPI_IP=$ip # rpi
export WEBKIT_INSPECTOR_HTTP_SERVER="$RPI_IP:9224"
export WPE_BCMRPI_TOUCH=1
export WPE_BCMRPI_CURSOR=1

echo Enter target: 
read $target
export TARGET=$target

echo Env vars are:
env
cog $TARGET