#!/bin/sh -x
#
# -*- coding: utf-8 -*-
# 日本語

if [ -f ./config.sh ]; then
	. ./config.sh
else
	echo "no config.sh"
	exit 1
fi

cd

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install python3-dev python3-venv

if [ ! -d ${ENVDIR} ]; then
	python3 -m venv ${ENVNAME}
	${ENVBIN}/python -m pip install --upgrade pip setuptools wheel
fi

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

# Setup for Files
cp ${ENVDIR}/lib/python3.5/site-packages/google/assistant/library/__main__.py ${ENVBIN}/${PROG_NAME}.py
chmod +x ${ENVBIN}/${PROG_NAME}.py

#git clone https://github.com/ytani01/${GIT_NAME}.git
cp ~/${GIT_NAME}/*.patch ${ENVBIN}
cp -r ~/${GIT_NAME}/sound ~
mkdir ~/bin
cp ~/${GIT_NAME}/bin/* ~/bin

#google-oauthlib-tool --scope https://www.googleapis.com/auth/assistant-sdk-prototype --save --headless --client-secrets /boot/${JSON_FNAME}.json
