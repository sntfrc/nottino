# nottino
Smart night light project for Jetson AI Specialist certification

![Photo of assembled Nottino prototype](https://github.com/sntfrc/nottino/raw/main/prototype.jpg)

## What is it?
Many children like to have some comfort light turned on at night. Modern LED night lights are not power hungry and could be left on all night, but having an always on background light somewhat degrades sleep quality.

Motion-activated night lights attempt to solve this problem, but children often move in their beds at night and the light would turn on unnecessarily and possibly disturb sleep more.

Nottino tries to do better by eschewing motion detection, and instead looking at the bed with an IR camera. A neural network AI model determines whether the picture likely contains a sleeping or awake situation, and acts accordingly.

## How?

The IR camera frames are fed to a fine tuned pre-trained ImageNet neural network, which has been trained to classify images into "awake" and "sleeping" _situations_. The meaning of _situation_ is flexible. Some information is a dead giveaway of an awake person (for example, pictures containing open eyes or person sitting in bed), while other can be more subtle.

At runtime, the awake/sleeping state derived from images is then filtered with debouncing and hysteresis is applied, to make the light only turn on after the awake condition is asserted for longer than a short time, and make the light turn off only after various minutes of constantly detecting a likely sleeping state.

Light is controlled using the great [BlinkStick](https://www.blinkstick.com/) boards and library. These are simple USB HID devices that allow color and intensity control of LED lights. APIs are available for many languages.

## Bill of materials
The Nottino prototype is assembled with these products:

 - Nvidia Jetson Nano Developer Kit 4GB
 - Waveshare IMX219-160IR 8 MP IR camera, with 2 IR LEDs
 - BlinkStick Nano

Components are easily obtainable, and are replaceable with better versions of the same. A production ready device could for example make use of a Jetson Orin, or a BlinkStick Pro.

## Hardware setup

1) Attach the IR illumination leds to the camera board with the provided screws.
2) Connect CSI ribbon cable to IR camera and developer kit, on connector CAM0. You can carefully fold the connector to make it fit inside the board bounding box.
3) Put insulating tape over the top metal part of the display/USB/ethernet ports to avoid contact with camera board pads
4) Mount the camera on the ports over the insulation tape, using double-sided tape. It should fit perfectly over the length of a Jetson Nano 4GB Developer Board's IO block.
5) Plug BlinkStick in one of the USB ports.

You can either use an external power supply, or attach an USB power bank to the back of the board to make it portable!

## Software

For the Jetson Nano operating system, the latest JetPack SDK 4.6.1 is used. To get a stable and CUDA-enabled PyTorch environment, Nottino runs in a Docker container based on Nvidia's DLI Course Environment Container. A Dockerfile is included which builds on the runtime environment by adding the BlinkStick API and making some needed small changes.

## Usage

1) Clone the repository on your Jetson Nano
2) Download the [pre-trained model](https://TODO/nottino.pth) into the project directory
3) Just run the run.sh script (or make it run automatically at startup).

There is no need to 'make' or 'docker build'. run.sh automatically takes care of building and starting the Docker container, if it's not already cached; so it can be directly invoked without any preparation activity.

After starting, the light will operate as described.

## Demo

TODO (YouTube video link and description)

## Further tweaking

You can refine the model by training it more on your personalized input, or training it from scratch altogether. You should probably do so in order to see acceptable results on your setup, since the provided model is only trained with a small amount of data specific to our test environment.

You can do this very conveniently by using the DLI container integrated development environment. To access it, just edit run.sh file by commenting out the "python3 /opt/nottino/nottino.py" line. After that, instead of running the program, run.sh will instead start the familiar DLI JupyterLab on port 8888. You can connect there and use the DLI classification notebook to refine the model.

Under the nottino/ directory you will find the nottino.py file that contains the code which is run upon startup. You can tweak it directly from JupyterLab and save the file. There is also a nottino-dev.ipynb development notebook, to test your inference and BlinkStick code live.

## Acknowledgments

I would like to thank some people for their important contributions:

- My wife, Francesca, who came up with the rough idea and its name.
- My son, Gioele, who helped by supplying a lot of training data. :)
