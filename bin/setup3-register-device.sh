#!/bin/sh
#

MYDIR=`dirname $0`
CONFIG_FILE=${MIDIR}/config.sh

if [ -f ${CONFIG_FILE} ]; then
	. ${CONFIG_FILE}
else
	echo "${CONFIG_FILE}: not found"
	exit 1
fi

if [ X${VIRTUAL_ENV} = X ]; then
	. ${ENVBIN}/activate
fi
if [ X${VIRTUAL_ENV} != X${ENVDIR} ]; then
	echo "Error"
	echo "  VIRTUAL_ENV=${VIRTUAL_ENV}"
	echo "  ENVDIR     =${ENVDIR}"
	exit 1
fi

PROJECT_ID=`get-project-id.py`

googlesamples-assistant-devicetool --project-id ${PROJECT_ID}
