#!/bin/sh

set -m

./bar.sh &

sleep 1
kill %1

