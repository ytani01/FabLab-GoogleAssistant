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
echo

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

googlesamples-assistant-devicetool --project-id ${PROJECT_ID} list --model
