from blinkstick import blinkstick
from jetcam.csi_camera import CSICamera
from time import sleep

camera = CSICamera(width=224, height=224, capture_device=0)
bs = blinkstick.find_first()

###

while True:
    bs.pulse(name="orange", duration=100, steps=250)
    break

###

camera.running = False
camera.cap.release()
