#!/bin/sh -x
#

BINDIR=${HOME}/bin

PKGS="python3-dev python3-venv"
PIP_PKGS="rpi.gpio netifaces Adafruit_SSD1306 Pillow textwrap mojimoji"

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
for p in ${PIP_PKGS}; do
	python -m pip install --upgrade $p
done

cd
if [ ! -d "OLED" ]; then
	git clone https://github.com/ytani01/OLED.git
fi

cd OLED/SSD1306/MisakiFont
cp -f boot-MisakiFont.sh ${BINDIR}
cp -f MisakiFont.py ipaddr.py ${ENVBIN}
cp -rf font ${HOME}
