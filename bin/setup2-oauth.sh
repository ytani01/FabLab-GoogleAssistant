#!/bin/sh -x
#

SCOPE_URL="https://www.googleapis.com/auth/assistant-sdk-prototype"

MYDIR=`dirname $0`
CONFIG_FILE=${MYDIR}/config.sh

if [ -f ${CONFIG_FILE} ]; then
	. ${CONFIG_FILE}
else
	echo "${CONFIG_FILE}: not found"
	exit 1
fi

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
	echo "Error."
	echo "  VIRTUAL_ENV=${VIRTUAL_ENV}"
	echo "  ENVDIR     =${ENVDIR}"
	exit 1
fi

exec google-oauthlib-tool --scope ${SCOPE_URL} --save --headless --client-secrets ${CREDENTIAL_JSON}
