#!/bin/sh

echo -n '========== '
date

BINDIR=${HOME}/bin

if [ -x ${BINDIR}/AQM1602A-time-ipaddr.py ]; then
	${BINDIR}/AQM1602A-time-ipaddr.py > /dev/null 2>&1 &
fi

if [ -x ${BINDIR}/FabLabKannai-GoogleAssistant.sh ]; then
	sleep 10
	${BINDIR}/FabLabKannai-GoogleAssistant.sh &
else
	while ! (aplay -l | grep seeed); do
	    echo -n '.'
	    sleep 1
	done
	${BINDIR}/boot-speakipaddr.sh repeat
fi

echo -n '========== '
date
