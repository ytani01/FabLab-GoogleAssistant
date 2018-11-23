#!/bin/sh -x

MYDIR=`dirname $0`
CONFIG_FILE=${MYDIR}/config.sh

if [ -f ${CONFIG_FILE} ]; then
	. ${CONFIG_FILE}
else
	echo "${CONFIG_FILE}: not found"
	exit 1
fi

CRONTAB_FILE="crontab.sample"

cd ${HOME}/${GIT_NAME}/bin

cp -fv ${CRONTAB_FILE} ${BINDIR}

crontab ${BINDIR}/${CRONTAB_FILE}

sudo shutdown -r now
