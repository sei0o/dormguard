import RPi.GPIO as GPIO
import time
import urllib, urllib2

gpio = 16
endpoint = "http://172.16.93.14:7665/status"

GPIO.setmode(GPIO.BOARD)
GPIO.setup(gpio, GPIO.IN)

try:
    while True:
        print(GPIO.input(gpio))

        req = urllib2.Request(endpoint)
        data = urllib.urlencode({"status": GPIO.input(gpio)}).encode("utf-8")
        urllib2.urlopen(req, data)

        time.sleep(0.5)

finally:
    GPIO.cleanup()
