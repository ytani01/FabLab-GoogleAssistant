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
