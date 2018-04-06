#!/bin/sh
#
# -*- coding: utf-8 -*-
# 日本語

if [ -f ./config.sh ]; then
	. config.sh
else
	echo "no config.sh"
	exit 1
fi

if [ X${VIRTUAL_ENV} = X ]; then
	. ${ENVBIN}/activate
fi
if [ X${VIRTUAL_ENV} != X${ENVDIR} ]; then
	echo "VIRTUAL_ENV=${VIRTUAL_ENV}"
	echo "ENVDIR     =${ENVDIR}"
	exit 1
fi

googlesamples-assistant-devicetool --project
