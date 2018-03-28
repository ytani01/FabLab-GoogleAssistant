#!/bin/sh -x
#
JSON_FNAME=tanibayashi
ENVNAME=env
ENVDIR=${HOME}/${ENVNAME}

cd

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install python3-dev python3-venv

python3 -m venv ${ENVNAME}
${ENVDIR}/bin/python -m pip install --upgrade pip setuptools wheel
. ${ENVDIR}/bin/activate

sudo apt-get -y install portaudio19-dev libffi-dev libssl-dev
python -m pip install --upgrade google-assistant-library
python -m pip install --upgrade google-assistant-sdk[samples]

python -m pip install --upgrade google-auth-oauthlib[tool]

google-oauthlib-tool --scope https://www.googleapis.com/auth/assistant-sdk-prototype --save --headless --client-secrets /boot/${JSON_FNAME}.json
