#!/bin/sh -x
#

MYDIR=`dirname $0`
CONFIG_FILE=${MYDIR}/config.sh

if [ -f ${CONFIG_FILE} ]; then
	. ${CONFIG_FILE}
else
	echo "${CONFIG_FILE}: not found"
	exit 1
fi

DIRS="bin etc tmp work"
PKGS="rcs vim nkf vlc emacs-nox"

BINDIR=${HOME}/bin
CMDS="boot.sh config.sh get-project-id.py ${PROG_NAME}.sh.sample"

cd
for i in ${DIRS}; do
    if [ ! -d $i ]; then
        mkdir $i
    fi
done

cd ${HOME}/${GIT_NAME}/bin
cp ${CMDS} ${BINDIR}
cp setup*.sh list-*.sh ${BINDIR}
cp requirements.txt ${BINDIR}

sudo apt update
sudo apt -y upgrade
sudo apt -y install ${PKGS}
