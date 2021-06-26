import screen_brightness_control as sbc

bt = sbc.get_brightness(display=0)
if(bt != 100):
    sbc.set_brightness('+20')
else:
    sbc.set_brightness(0)