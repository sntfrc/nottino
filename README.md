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
TODO
