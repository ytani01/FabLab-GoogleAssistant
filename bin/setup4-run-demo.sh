#!/bin/sh
#
MYNAME=`basename $0`

usage () {
    echo usage: ${MYNAME} model_id
}

MODEL_ID=$1
if [ X$1 = X ]; then
    echo "no model_id"
    echo
    usage
    exit 1
fi

echo "MODEL_ID=${MODEL_ID}"

MYDIR=`dirname $0`
CONFIG_FILE=${MYDIR}/config.sh

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

googlesamples-assistant-hotword --project_id ${PROJECT_ID} \
       --device_model_id ${MODEL_ID}
