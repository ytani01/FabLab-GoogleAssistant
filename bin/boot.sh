#!/bin/sh

echo -n '========== '
date

BINDIR=${HOME}/bin
LOGDIR=${HOME}/tmp
ENVDIR=${HOME}/env
ENVBIN=${ENVDIR}/bin
MISAKIFONT=${ENVBIN}/MisakiFont.py

if [ -d ${ENVDIR} ]; then
	. ${ENVBIN}/activate
fi

while ! (aplay -l | grep seeed); do
	echo -n "."
	sleep 1
done

if [ -x ${MISAKIFONT} ]; then
	${MISAKIFONT} &
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
