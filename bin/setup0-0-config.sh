#!/bin/sh
#

BINDIR=${HOME}/bin

cd
mkdir bin etc tmp work

sudo apt update
sudo apt -y upgrade
sudo apt -y install rcs vim nkf

sudo raspi-config
