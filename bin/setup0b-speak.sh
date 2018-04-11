#!/bin/sh
#

BINDIR=${HOME}/bin

PKGS="open-jtalk-mecab-naist-jdic hts-voice-nitech-jp-atr503-m001"

sudo apt update
sudo apt -y upgrade
sudo apt -y install ${PKGS}

cd
git clone https://github.com/ytani01/speak.git

if [ ! -d ${BINDIR} ]; then
    mkdir ${BINDIR}
fi

cd ${BINDIR}
cp -f ${HOME}/speak/*.sh .
cp -f ${HOME}/speak/*.py .
