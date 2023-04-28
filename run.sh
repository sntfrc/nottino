#!/bin/sh

HOMEDIR="$(dirname "$(readlink -f "$0")")"
mkdir -p $HOMEDIR/work

cd $HOMEDIR
sudo docker build . -t sntfrc/nottino

sudo docker run --runtime nvidia -it --rm \
	--network host \
	--privileged -v /dev/bus/usb:/dev/bus/usb \
	-v /tmp/argus_socket:/tmp/argus_socket \
	-v /etc/enctune.conf:/etc/enctune.conf \
	-v /etc/nv_tegra_release:/etc/nv_tegra_release \
	-v /tmp/nv_jetson_model:/tmp/nv_jetson_model \
	-v $HOMEDIR:/opt/nottino \
	--device /dev/video0 \
	sntfrc/nottino:latest

