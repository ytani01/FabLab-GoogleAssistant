#!/bin/sh

echo -n '========== '
date

BINDIR=${HOME}/bin

LCD=""

CMD=${BINDIR}/thermometer-ipaddr-time.py
I2C_DETECT=`/usr/sbin/i2cdetect -y 1 | grep 3e | sed 's/:.*$//'`
echo "I2C_DETECT=${I2C_DETECT}"
if [ -x ${CMD} ]; then
	if [ X${I2C_DETECT} != X ]; then
		${CMD} > /dev/null 2>&1 &
		LCD="ON"
	fi
fi

while ! (aplay -l | grep seeed); do
	echo -n "."
	sleep 1
done

if [ X${LCD} = X ]; then
	CMD="${BINDIR}/boot-speakipaddr.sh"
	if [ -x ${CMD} ]; then
		${CMD}
	fi
fi

CMD="${BINDIR}/FabLabKannai-GoogleAssistant.sh"
if [ -x ${CMD} ]; then
	${CMD} &
fi

echo -n '========== '
date
