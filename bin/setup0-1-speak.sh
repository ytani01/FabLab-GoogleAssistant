#!/bin/sh
#

BINDIR=${HOME}/bin

sudo apt update
sudo apt -y upgrade
sudo apt -y install open-jtalk open-jtalk-mecab-naist-jdic hts-voice-nitech-jp-atr503-m001

if [ ! -d ${BINDIR} ]; then
    mkdir ${BINDIR}
fi

cd
git clone https://github.com/ytani01/speak.git

cd ${BINDIR}
ln -s ~/speak/*.sh .
ln -s ~/speak/*.py .
