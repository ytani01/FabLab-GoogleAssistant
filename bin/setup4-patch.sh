#!/bin/sh -x
#
MYNAME=tanibayashi
ENVNAME=env
ENVDIR=${HOME}/${ENVNAME}
OBJ_NAME=FabLabKannai-GoogleAssistant
GIT_NAME=FabLabKannai-GoogleAssistant

. ${ENVDIR}/bin/activate
python -m pip install --upgrade rpi.gpio

cd ${ENVDIR}/bin
cp ${OBJ_NAME}.py ${OBJ_NAME}-0.py
patch -b ${OBJ_NAME}.py < 1.patch
cp ${OBJ_NAME}.py ${OBJ_NAME}-1.py
patch -b ${OBJ_NAME}.py < 2.patch
cp ${OBJ_NAME}.py ${OBJ_NAME}-2.py
patch -b ${OBJ_NAME}.py < 3.patch
cp ${OBJ_NAME}.py ${OBJ_NAME}-3.py
patch -b ${OBJ_NAME}.py < 4.patch
cp ${OBJ_NAME}.py ${OBJ_NAME}-4.py
