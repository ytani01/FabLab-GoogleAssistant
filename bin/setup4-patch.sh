#!/bin/sh
#

MYDIR=`dirname $0`
CONFIG_FILE=${MIDIR}/config.sh

if [ -f ${CONFIG_FILE} ]; then
	. ${CONFIG_FILE}
else
	echo "${CONFIG_FILE}: not found"
	exit 1
fi

#cd
#git clone https://github.com/ytani01/${GIT_NAME}.git
cd ${HOME}/${GIT_NAME}
cp -f *.patch ${ENVBIN}
cp -rf sound ~

if [ ! -d ${HOME}/bin ]; then
    mkdir ${HOME}/bin
fi
cd ${HOME}/${GIT_NAME}/bin
cp -f *.sh *.py ${HOME}/bin

. ${ENVBIN}/activate
python -m pip install --upgrade rpi.gpio
