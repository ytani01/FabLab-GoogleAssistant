#!/bin/sh -x
#

BINDIR=${HOME}/bin

PKGS="python3-dev python3-venv"
PIP_PKGS="rpi.gpio Adafruit_SSD1306 textwrap mojimoji"

MYDIR=`dirname $0`
CONFIG_FILE=${MYDIR}/config.sh

if [ -f ${CONFIG_FILE} ]; then
	. ${CONFIG_FILE}
else
	echo "${CONFIG_FILE}: not found"
	exit 1
fi

sudo apt update
sudo apt -y upgrade
sudo apt -y install ${PKGS}

. ${ENVBIN}/activate
python -m pip install --upgrade ${PIP_PKGS}

cd
git clone https://github.com/ytani01/OLED.git

cd OLED/SSD1306/MisakiFont
cp -f MisakiFont.py ${ENVBIN}
cp -rf font ${HOME}
