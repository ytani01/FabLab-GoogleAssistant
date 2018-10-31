#!/bin/sh

echo -n '========== '
date

BINDIR=${HOME}/bin
LOGDIR=${HOME}/tmp
ENVDIR=${HOME}/env
ENVBIN=${ENVDIR}/bin
BOOT_MISAKIFONT=${BINDIR}/boot-MisakiFont.sh

if [ -f ${ENVDIR}/activate ]; then
	. ${ENVBIN}/activate
fi

if [ -x ${BOOT_MISAKIFONT} ]; then
	${BOOT_MISAKIFONT} &
fi

CMD="${BINDIR}/speakipaddr.sh"
if [ -x ${CMD} ]; then
	${CMD} repeat
fi

CMD="${BINDIR}/FabLabKannai-GoogleAssistant.sh"
LOGFILE="${LOGDIR}/`basename ${CMD}`.log"
if [ -x ${CMD} ]; then
	exec ${CMD}
	#${CMD} > ${LOGFILE} 2>&1 &
fi

echo -n '========== '
date
