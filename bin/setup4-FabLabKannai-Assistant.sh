#!/bin/sh
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
cp -f *.patch ${ENVBIN}
cp -rf sound ~

### mic_hat
cd ${HOME}/mic_hat
cp *.py ${ENVBIN}

. ${ENVBIN}/activate
python -m pip install --upgrade rpi.gpio
