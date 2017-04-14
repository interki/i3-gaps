#!/usr/bin/env python
import json
import urllib.request

CURRENCY = "AUD"
with urllib.request.urlopen("https://blockchain.info/ticker") as url:
    data = json.loads(url.read().decode())
    price = (data[CURRENCY]['last'])
    print(":{0:.0f}".format(price))
