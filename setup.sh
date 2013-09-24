#!bin/bash

echo "importing MongoDB public GPG Key \n"

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo "\ncreating /etc/apt/sources.list.d/mongodb.list \n"

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

echo "\nreloading repository \n"

sudo apt-get update

echo "\ninstalling latest version of MongoDB \n"

sudo apt-get install mongodb-10gen

echo "\ninstalling default-jre \n"

sudo apt-get install default-jre

echo "\n installing default-jdk \n"

sudo apt-get install default-jdk

echo "\ninstalling scala \n"

sudo apt-get install scala

echo "\ninstalling unzip for play \n"

sudo apt-get install unzip

echo "\nwget play \n"

wget http://downloads.typesafe.com/play/2.2.0/play-2.2.0.zip

echo "\nunzipping play \n"

unzip play-2.2.0.zip

echo "\nmoving things into place\n"

sudo mv play-2.2.0 /opt

echo "\nsetting up symlinks\n"

sudo ln -s /opt/play-2.2.0 /opt/play

sudo ln -s /opt/play/play /usr/local/bin/play

echo "\n checking if setup successful... \n"

play
