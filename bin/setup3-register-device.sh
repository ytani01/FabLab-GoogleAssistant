#!/bin/sh -x
#
MYNAME=`basename $0`

usage () {
    echo usage: ${MYNAME} model_id device_id
}

MODEL_ID=$1
DEVICE_ID=$2
if [ X$1 = X ]; then
    echo "no model_id"
    echo
    usage
    exit 1
fi
if [ X$2 = X ]; then
    echo "no device_id"
    echo
    usage
    exit 1
fi

echo "MODEL_ID=${MODEL_ID}"
echo "DEVICE_ID=${DEVICE_ID}"

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

googlesamples-assistant-devicetool --project-id ${PROJECT_ID} register-device \
       --client-type LIBRARY \
       --model ${MODEL_ID} \
       --device ${DEVICE_ID}
googlesamples-assistant-devicetool --project-id ${PROJECT_ID} list --device
