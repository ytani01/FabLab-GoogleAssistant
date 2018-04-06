#!/bin/sh

BINDIR=${HOME}/bin

if [ -x ${BINDIR}/AQM1602A-time-ipaddr.py ]; then
	${BINDIR}/AQM1602A-time-ipaddr.py > /dev/null 2>&1 &
fi

if [ -x ${BINDIR}/FabLabKannai-GoogleAssistant.sh ]; then
	sleep 10
	${BINDIR}/FabLabKannai-GoogleAssistant.sh &
else
	${BINDIR}/boot-speakipaddr.sh repeat
fi
