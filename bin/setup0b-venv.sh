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

sudo apt update
sudo apt -y upgrade
sudo apt -y install python3-dev python3-venv

cd
if [ ! -d ${ENVDIR} ]; then
	python3 -m venv ${ENVNAME}
fi
${ENVBIN}/python -m pip install --upgrade pip setuptools wheel
${ENVBIN}/python -m pip install -r ${BINDIR}/requirements.txt

if [ ! -f ${ENVBIN}/activate ]; then
	echo "file not found: ${ENVBIN}/activate"
	exit 1
fi

exit 0
