FROM nvcr.io/nvidia/dli/dli-nano-ai:v2.0.2-r32.7.1
#FROM dustynv/jetson-inference:r32.7.1

RUN add-apt-repository --remove "deb https://apt.kitware.com/ubuntu/ bionic main"
RUN apt-get update
RUN apt-get install -y python3-usb dos2unix

RUN python3 -m pip install blinkstick imutils

RUN dos2unix /usr/local/bin/blinkstick
RUN chmod a+x /usr/local/bin/blinkstick
RUN sed -i "s/env python/env python3/" /usr/local/bin/blinkstick

RUN ln -s /opt/nottino /nvdli-nano/nottino

