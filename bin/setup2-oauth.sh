#!/bin/sh
#
# -*- coding: utf-8 -*-
# 日本語

if [ -f ./config.sh ]; then
	. ./config.sh
else
	echo "no config.sh"
	exit 1
fi

SCOPE_URL="https://www.googleapis.com/auth/assistant-sdk-prototype"

if [ ! -f ${CREDENTIAL_JSON} ]; then
	echo "${CREDENTIAL_JSON}: not found"
	exit 1
fi

if [ X${VIRTUAL_ENV} = X ]; then
	if [ ! -f ${ENVBIN}/activate ]; then
		echo "${ENVBIN}/activate: not found"
		exit 1
	fi
	. ${ENVBIN}/activate
fi
if [ X${VIRTUAL_ENV} != X${ENVDIR} ]; then
	echo "VIRTUAL_ENV=${VIRTUAL_ENV}"
	echo "ENVDIR     =${ENVDIR}"
	exit 1
fi

exec google-oauthlib-tool --scope ${SCOPE_URL} --save --headless --client-secrets ${CREDENTIAL_JSON}
