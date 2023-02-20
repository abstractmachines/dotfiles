#!/bin/bash

echo "enter RPI IP"
read ip
echo IP: $ip

echo "enter RPI usr"
read usr
echo usr: $usr

export RPI_IP=$ip
export RPI_USR=$usr

echo "ssh: $RPI_USR@$RPI_IP ..."

# ssh-keygen -R $RPI_IP

ssh $RPI_USR@$RPI_IP
