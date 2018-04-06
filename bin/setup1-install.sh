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

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install python3-dev python3-venv

cd
if [ ! -d ${ENVDIR} ]; then
	python3 -m venv ${ENVNAME}
fi
${ENVBIN}/python -m pip install --upgrade pip setuptools wheel

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
cp -f ${ENVDIR}/lib/python3.5/site-packages/google/assistant/library/__main__.py ${ENVBIN}/${PROG_NAME}.py
chmod +x ${ENVBIN}/${PROG_NAME}.py

#git clone https://github.com/ytani01/${GIT_NAME}.git
cd ${HOME}/${GIT_NAME}
cp -f *.patch ${ENVBIN}
cp -rf sound ~

if [ -d ~/bin ]; then
    mkdir ~/bin
fi
cd ${HOME}/${GIT_NAME}/bin
cp -f *.sh *.py ~/bin
