#!/bin/bash

echo "enter RPI IP"
read $ip
echo "enter RPI usr"
read $usr
export RPI_IP=$ip
export RPI_USR=$usr

# ssh-keygen -R $RPI_IP
# sshpass -p $RPI_PW ssh $RPI_USR@$RPI_IP

ssh $RPI_USR@$RPI_IP
