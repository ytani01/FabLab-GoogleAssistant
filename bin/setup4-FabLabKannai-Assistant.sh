#!/bin/sh -x
#

MYDIR=`dirname $0`
CONFIG_FILE=${MYDIR}/config.sh

if [ -f ${CONFIG_FILE} ]; then
	. ${CONFIG_FILE}
else
	echo "${CONFIG_FILE}: not found"
	exit 1
fi

#cd
#git clone https://github.com/ytani01/${GIT_NAME}.git
cd ${HOME}/${GIT_NAME}
cp -f *.patch *.py ${ENVBIN}
cp -rf sound ~

. ${ENVBIN}/activate
python -m pip install --upgrade rpi.gpio
