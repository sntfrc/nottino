FROM dustynv/jetson-inference:r32.7.1
RUN apt update
RUN apt install -y python3-usb
RUN python3 -m pip install blinkstick

