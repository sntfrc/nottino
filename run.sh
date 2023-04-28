#!/bin/sh

HOMEDIR="$(dirname "$(readlink -f "$0")")"
mkdir -p $HOMEDIR/work

sudo docker run -it --rm --privileged -v /dev/bus/usb:/dev/bus/usb -v $HOMEDIR:/opt/nottino -v $HOMEDIR/work:/jetson-inference --device

#docker/run.sh -c sntfrc/nottino -v "$HOMEDIR:/opt/nottino --privileged -v /dev/bus/usb:/dev/bus/usb" -r "python3 /opt/nottino/nottino.py"

