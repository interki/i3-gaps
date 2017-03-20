#!/usr/bin/env python

import urllib.request
import json

api = "be3c5e1b5870e42570ce6dd5d23a3c13"
location = "-27.7175,153.2045"
units = "ca"

temp_warm = 30
alarm_windy = 30

res = urllib.request.urlopen('https://api.darksky.net/forecast/{0}/{1}?units={2}'.format(api, location, units))
res_body = res.read()
j = json.loads(res_body.decode("utf-8"))

icon = (j['currently']['icon'])
temperature = (j['currently']) ['temperature']
summary = (j['currently']) ['summary']
wind_speed = (j['currently']) ['windSpeed']
wind_bearing = (j['currently']) ['windBearing']
pressure = (j['currently']) ['pressure']

icon = {
    "clear-day": "",
    "clear-night": "",
    "rain": "",
    "snow": "",
    "sleet": "",
    "wind": "",
    "fog": "",
    "cloudy": "",
    "partly-cloudy-day": "",
    "partly-cloudy-night": "",
   }.get(icon, "")

print ("{0}{1}°C".format(icon, round(temperature)), "{0}kph".format(round(wind_speed)), "{0}°".format(wind_bearing), "{0:.1f}".format(pressure - 1000))
print ("{0}{1}°C".format(icon, round(temperature)), "{0}kph".format(round(wind_speed)), "{0}°".format(wind_bearing), "{0:.1f}".format(pressure - 1000))

##- with summary
# print ("{0}{1}°C".format(icon, round(temperature)), "~{0}~".format(summary), "{0}kph".format(round(wind_speed)), "{0}°".format(wind_bearing), "{0:.2f}".format(pressure - 1000))
# print ("{0}{1}°C".format(icon, round(temperature)), "~{0}~".format(summary), "{0}kph".format(round(wind_speed)), "{0}°".format(wind_bearing), "{0:.2f}".format(pressure - 1000))

##- define colour
if round(wind_speed) >= alarm_windy:
   print ("#db2b2b")
elif icon == "":
   print ("#72cbd8")
elif round(temperature) >= temp_warm:
   print ("#f58312")

exit(0)
