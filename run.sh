#!/bin/sh

HOMEDIR="$(dirname "$(readlink -f "$0")")"
mkdir -p $HOMEDIR/work

cd $HOMEDIR
sudo docker build . -t sntfrc/nottino

sudo docker run --runtime nvidia -t --rm \
	--name nottino \
	--network host \
	--privileged -v /dev/bus/usb:/dev/bus/usb \
	-v /tmp/argus_socket:/tmp/argus_socket \
	-v $HOMEDIR:/opt/nottino \
	-v $HOMEDIR/work:/nvdli-nano/data \
	--device /dev/video0 \
	sntfrc/nottino:latest \
	/bin/bash /opt/nottino/startup-cmd
