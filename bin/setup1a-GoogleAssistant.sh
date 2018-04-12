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

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install python3-dev python3-venv

cd
if [ ! -d ${ENVDIR} ]; then
	python3 -m venv ${ENVNAME}
fi
${ENVBIN}/python -m pip install --upgrade pip setuptools wheel
${ENVBIN}/python -m pip install --upgrade spidev rpi.gpio

if [ ! -f ${ENVBIN}/bin/activate]; then
	echo "Something is wrong ..."
	exit 1
fi
# Activate Vertual Environment
. ${ENVBIN}/activate

# Install Packages
sudo apt-get -y install portaudio19-dev libffi-dev libssl-dev
python -m pip install --upgrade google-assistant-library
python -m pip install --upgrade google-assistant-sdk[samples]
python -m pip install --upgrade google-auth-oauthlib[tool]

cd ${ENVDIR}/lib/python3.5/site-packages/google/assistant/library
cp __main__.py ${ENVBIN}
cd ${ENVBIN}
cp __main__.py ${PROG_NAME}.py
chmod +x ${PROG_NAME}.py
