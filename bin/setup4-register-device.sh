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
    echo usage: ${MYNAME} device_id
}

### Project ID
PROJECT_ID=`get-project-id.py`
echo "PROJECT_ID=${PROJECT_ID}"

### Model ID
if [ X${MODEL_ID} = X ]; then
    echo "ERROR: No model_id"
    echo "Please run: setup3-...sh  model_id"
    echo "Terminate by [Ctrl]-[C]"
    echo "then .."
    echo "Try agian."
    echo
    exit 1
fi
echo "MODEL_ID=${MODEL_ID}"

### Device ID
if [ X$1 != X ]; then
    DEVICE_ID=$1
fi

if [ X${DEVICE_ID} = X ]; then
    echo "ERROR: No device_id"
    echo
    usage
    echo
    exit 1
fi

echo ${DEVICE_ID} > ${DEVICE_ID_FILE}
echo "DEVICE_ID=${DEVICE_ID}"

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

googlesamples-assistant-devicetool --project-id ${PROJECT_ID} register-device \
       --client-type LIBRARY \
       --model ${MODEL_ID} \
       --device ${DEVICE_ID}
googlesamples-assistant-devicetool --project-id ${PROJECT_ID} list --device
