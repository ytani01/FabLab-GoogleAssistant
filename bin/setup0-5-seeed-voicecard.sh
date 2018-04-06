#!/bin/sh
#

cd
git clone https://github.com/respeaker/seeed-voicecard

cd seeed-voicecard
sudo ./install.sh
if $? ne 0; then
   echo ====================
   echo Something is wrong !!
   echo Check Error messages.
   echo ====================
   exit 1
fi
echo ====================
echo after shutdown:
echo ' '  Remove power cable.
echo ' '  Put ReSpeaker 2-mics Pi HAT on Raspberry Pi.
echo ' '  Insert power cable to boot again.
echo ' '  Test speaker and mic.
echo ====================
sudo shutdown -h +1
