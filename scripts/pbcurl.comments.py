#!/usr/bin/env python
import json, urllib.request, datetime
from sys import executable
from subprocess import *

## select twitch user 
print ('\n1: {0:>1}\n2: {1:>1}\n3: {2}\n4: {3}\n'.format('sips_', 'pyrionflax', 'hatfilms', 'hutch'))
channel = input("channel #no.? ")

## convert user input into channel string
channel = {
    "1":    "sips_",
    "2":    "pyrionflax",
    "3":    "hatfilms",
    "4":    "hutch",
   }.get(channel, "sips_")

## jason request twitch api
res = urllib.request.urlopen('https://api.twitch.tv/kraken/channels/{0}/videos?broadcasts=true&client_id=caozjg12y6hjop39wx996mxn585yqyk'.format(channel))
res_body = res.read()
j = json.loads(res_body.decode("utf-8"))

## column headings
print ("\n{0}: {1:^30} {2:^9} {3:^7} {4:^7} {5:^6}".format("#", "Title", "Length", "Date", "Time", "Game"))

## check if total videos is <=9 
total = (j['_total'])
if total <= 9:
    itera = total
else:
    itera = 10

## iterate through past broadcasts collecting information for display
for x in range (itera):
    title = (j['videos'][x]['title'])
    length = (j['videos'][x]['length'])
    created_at = (j['videos'][x]['created_at'])
    game = (j['videos'][x]['game'])
    url = (j['videos'][x]['url'])

## format and print broadcast information
    if x <= 8: 
        print ("{0}:  {1:30} {2:8}".format((x+1), title, "|"+str(datetime.timedelta(seconds=(length)))+"|"), "|{0}| |{1}|".format(created_at[5:10],created_at[11:16]), "-"+game)
## offset row for extra digit in #10 
    else:
        print ("{0}: {1:30} {2:8}".format((x+1), title, "|"+str(datetime.timedelta(seconds=(length)))+"|"), "|{0}| |{1}|".format(created_at[5:10],created_at[11:16]), "-"+game)

## user input select broadcast
option = int(input("\nbroadcast #no.? "))

## convert user input into base 0, and collect relevant video url
vidno = option - 1
opt = (j['videos'][vidno]['url'])

## select video quality 
print ('\n1: {0:>1}\n2: {1:>1}\n3: {2}\n4: {3}\n'.format('low', 'medium', 'high', 'source'))
qual = input('\nquality #no.? // Press Enter for defualt (high)\n')

## convert user input into quality string
qual = {
        '1':    'low',
        '2':    'medium',
        '3':    'high',
        '4':    'source',
        }.get(qual, 'high')

print ("\nstarting....\n")

## pass request to streamlink in external shell
run = str("streamlink {0} {1} --player-passthrough=hls".format(opt, qual))
handle = Popen((run), stdin=PIPE, stderr=PIPE, stdout=PIPE, shell=True)
print (handle.stdout.read())

exit()