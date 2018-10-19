#!/bin/sh -x
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

SRCFILE="FabLabKannai-GoogleAssistant.sh.sample"
DSTFILE="FabLabKannai-GoogleAssistant.sh"

### usage
usage () {
    echo usage: ${MYNAME}
}

### copy
cd ${BINDIR}
cp ${SRCFILE} ${DSTFILE}
