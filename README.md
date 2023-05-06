# nottino
Smart night light project for Jetson AI Specialist certification

## What is it?
Many children like to have some comfort light turned on at night. Modern LED night lights are not power hungry and could be left on all night, but having an always on background light somewhat degrades sleep quality.
Motion-activated night lights attempt to solve this problem, but children often move in their beds at night and the light would turn on unnecessarily and possibly disturb sleep more.

Nottino tries to do better by eschewing motion detection, and instead looking at the bed with an IR camera. A neural network AI model determines whether the picture likely contains a sleeping or awake situation, and acts accordingly.

## How?

The IR camera frames are fed to a fine tuned pre-trained ImageNet neural network, which has been trained to classify images into "awake" and "sleeping" situations. The meaning of 'situation' is flexible. Some information is a dead giveaway of an awake person (for example, pictures containing open eyes or person sitting in bed), while other can be more subtle.
At runtime, the awake/sleeping state derived from images is then filtered with debouncing and hysteresis is applied, to make the light only turn on after the awake condition is asserted for longer than a short time, and make the light turn off only after various minutes of constantly detecting a likely sleeping state.

Light is controlled using the great [BlinkStick](https://www.blinkstick.com/) boards and library. These are simple USB HID devices that allow color and intensity control of LED lights. APIs are available for many languages.

## Bill of materials
The Nottino prototype is assembled with these products:

 - Nvidia Jetson Nano Developer Kit 4GB
 - Waveshare IMX219-160IR 8 MP IR camera, with 2 IR LEDs
 - BlinkStick Nano

Components are easily obtainable, and are replaceable with better versions of the same. A production ready device could for example make use of a Jetson Orin, or a BlinkStick Pro.

## Software

For the Jetson Nano operating system, the latest JetPack SDK 4.6.1 is used. To get a stable and CUDA-enabled PyTorch environment, Nottino runs in a docker container based on Nvidia's DLI Course Environment Container. A Dockerfile is included which builds on the runtime environment by adding the BlinkStick API and making some needed small changes.

## Usage

Just clone the repository on your Jetson Nano, and download the fine tuned model into the project directory. Then you can just run the run.sh script (or make it run automatically at startup). There is no need to 'make' or 'docker build', run.sh automatically takes care of building and starting the Docker container, if it's not already cached; so it can be directly invoked without any preparation activity.

After starting, the light will start operating as described.

## Further tweaking

You can refine the model by training it more on your personalized input, or training it from scratch altogether. You can do this very conveniently by using the DLI container integrated development environment. To access it, just edit run.sh file by commenting out the "python3 /opt/nottino/nottino.py" line. After that, instead of running the program, run.sh will instead start the familiar DLI JupyterLab on port 8888. You can connect there and use the DLI notebooks to refine the model.
