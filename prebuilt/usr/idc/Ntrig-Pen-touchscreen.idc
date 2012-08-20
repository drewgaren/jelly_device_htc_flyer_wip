
touch.deviceType=touchScreen
keyboard.layout=flyer-keypad-v0
keyboard.builtIn=1
keyboard.orientationAware=1
device.internal=1

#touch.size.calibration=diameter
#touch.size.scale=7.0

# Size
# Based on empirical measurements, we estimate the size of the contact
# using size = sqrt(area) * 28 + 0.
touch.size.calibration = area
touch.size.scale = 28
touch.size.bias = 0
touch.size.isSummed = 0

# Pressure
# Driver reports signal strength as pressure.
#
# A normal index finger touch typically registers about 80 signal strength
# units although we don't expect these values to be accurate.
touch.pressure.calibration = amplitude
touch.pressure.scale = 0.5

# Orientation
touch.orientation.calibration = vector
     


