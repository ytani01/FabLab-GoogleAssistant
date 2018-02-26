#!/bin/sh -x
#
MYNAME=tanibayashi
ENVNAME=env
ENVDIR=${HOME}/${ENVNAME}
OBJ_NAME=FabLabKannai-GoogleAssistant
GIT_NAME=FabLabKannai-GoogleAssistant

cp ${ENVDIR}/lib/python3.5/site-packages/google/assistant/library/__main__.py ${ENVDIR}/bin/${OBJ_NAME}.py
chmod +x ${ENVDIR}/bin/${OBJ_NAME}.py

cd ~
git clone https://github.com/ytani01/${GIT_NAME}.git
cp ~/${GIT_NAME}/*.patch ${ENVDIR}/bin
cp -r ~/${GIT_NAME}/sound ~
