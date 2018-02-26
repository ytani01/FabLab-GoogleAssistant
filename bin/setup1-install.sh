#!/bin/sh -x
#
MYNAME=tanibayashi
ENVNAME=env
ENVDIR=${HOME}/${ENVNAME}

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install python3-dev python3-venv portaudio19-dev libffi-dev libssl-dev

cd
python3 -m venv ${ENVNAME}
${ENVDIR}/bin/python -m pip install --upgrade pip setuptools wheel
. ${ENVDIR}/bin/activate

python -m pip install --upgrade google-assistant-library
python -m pip install --upgrade google-assistant-sdk[samples]
python -m pip install --upgrade google-auth-oauthlib[tool]

google-oauthlib-tool --scope https://www.googleapis.com/auth/assistant-sdk-prototype --save --headless --client-secrets /boot/${MYNAME}.json
