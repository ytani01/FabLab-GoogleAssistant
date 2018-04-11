#!/bin/sh
#

BINDIR=${HOME}/bin

PKGS="rcs vim nkf vlc"

cd
mkdir bin etc tmp work

sudo apt update
sudo apt -y upgrade
sudo apt -y install ${PKGS}

sudo raspi-config
