#!/bin/sh
#

MYFILES=".bash_history .gitconfig"
SYSFILES="/boot/credentials.json /etc/wpa_supplicant/wpa_supplicant.conf"

###
check_and_rm1 () {
    echo -n $1
    if [ -f $1 ]; then
	echo -n " ... found"
	rm -f $1
	echo -n " ... removed."
    else
        echo -n " ... not found"
    fi
    echo
}


###
for f in ${MYFILES}; do
    check_and_rm1 ${HOME}/$f
done

for f in ${SYSFILES}; do
    check_and_rm1 $f
done


### clean up ssh key
sudo systemctl enable regenerate_ssh_host_keys.service

sudo shutdown -h +1
