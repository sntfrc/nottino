from blinkstick import blinkstick

bs = blinkstick.find_all()[0]
bs.pulse(name="red", duration=3000, steps=250)

