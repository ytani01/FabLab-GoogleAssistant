#!/bin/sh -x
# -*- coding: utf-8 -*-
# 日本語

CREDENTIAL_FNAME=credentials
CREDENTIAL_JSON=/boot/${CREDENTIAL_FNAME}.json

ENVNAME=env
ENVDIR=${HOME}/${ENVNAME}
ENVBIN=${ENVDIR}/bin

BINDIR=${HOME}/bin
ETCDIR=${HOME}/etc
TMPDIR=${HOME}/tmp


GIT_NAME=FabLabKannai-GoogleAssistant
PROG_NAME=${GIT_NAME}

MODEL_ID_FILE=${HOME}/bin/model-id.txt
MODEL_ID=""
if [ -r ${MODEL_ID_FILE} ]; then
    MODEL_ID=`cat ${MODEL_ID_FILE}`
fi

DEVICE_ID_FILE=${HOME}/bin/device-id.txt
DEVICE_ID=""
if [ -r ${DEVICE_ID_FILE} ]; then
    DEVICE_ID=`cat ${DEVICE_ID_FILE}`
fi
