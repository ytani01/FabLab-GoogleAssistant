#!/bin/sh
#
MYNAME=`basename $0`
MYDIR=`dirname $0`
CONFIG_FILE=${MYDIR}/config.sh

if [ -f ${CONFIG_FILE} ]; then
    . ${CONFIG_FILE}
else
    echo "${CONFIG_FILE}: not found"
    exit 1
fi

### usage
usage () {
    echo "usage: ${MYNAME} [model_id]"
}

### Project ID
PROJECT_ID=`get-project-id.py`
echo "PROJECT_ID=${PROJECT_ID}"

### Model ID
if [ X$1 != X ]; then
    MODEL_ID=$1
fi

if [ X${MODEL_ID} = X ]; then
    echo "ERROR: No model_id"
    echo
    usage
    echo
    exit 1
fi

echo ${MODEL_ID} > ${MODEL_ID_FILE}
echo "MODEL_ID=${MODEL_ID}"

### venv
if [ X${VIRTUAL_ENV} = X ]; then
	. ${ENVBIN}/activate
fi
if [ X${VIRTUAL_ENV} != X${ENVDIR} ]; then
	echo "Error"
	echo "  VIRTUAL_ENV=${VIRTUAL_ENV}"
	echo "  ENVDIR     =${ENVDIR}"
	exit 1
fi

###
set -m

googlesamples-assistant-hotword --project_id ${PROJECT_ID} \
       --device_model_id ${MODEL_ID} &

sleep 7
kill %1
