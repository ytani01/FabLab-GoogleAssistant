#!/bin/sh -x
#

cd
git clone https://github.com/respeaker/seeed-voicecard

cd seeed-voicecard
sudo ./install.sh && sudo reboot
