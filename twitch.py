#This script checks if a user on twitch is currently streaming and then records the stream via livestreamer

from urllib.request import urlopen
from urllib.error import URLError
from threading import Timer
import os
import time
import json
import sys
import subprocess
import datetime
import configparser

def check_user(user):
    """ returns 0: online, 1: offline, 2: not found, 3: error """
    global info
    url = 'https://api.twitch.tv/kraken/streams/' + user +"/?client_id=jzkbprff40iqj646a697cyrvl0zt2m6"
    try:
        info = json.loads(urlopen(url, timeout = 15).read().decode('utf-8'))
        if info['stream'] == None:
            status = 1
        else:
            status = 0
    except URLError as e:
        if e.reason == 'Not Found' or e.reason == 'Unprocessable Entity':
            status = 2
        else:
            status = 3
    return status

def format_filename(fname):
# Removes invalid characters from filename
    fname = fname.replace("/","")
    fname = fname.replace("?","")
    fname = fname.replace(":","-")
    fname = fname.replace("\\","")
    fname = fname.replace("<","")
    fname = fname.replace(">","")
    fname = fname.replace("*","")
    fname = fname.replace("\"","")
    fname = fname.replace("|","")
    return fname


def loopcheck():
    while True:
        status = check_user(user)
        if status == 2:
            print("username not found. invalid username?")
        elif status == 3:
            print(datetime.datetime.now().strftime("%Hh%Mm%Ss")," ","unexpected error. will try again in 5 minutes.")
            time.sleep(15)
        elif status == 1:
            print(user,"currently offline, checking again in",refresh,"seconds")
            time.sleep(refresh) # 30 seconds
        elif status == 0:
            print(user,"online. stop.")
            filename = user+" - "+datetime.datetime.now().strftime("%Y-%m-%d %Hh%Mm%Ss")+" - "+(info['stream']).get("channel").get("status")+".mp4"
            filename = format_filename(filename)
            subprocess.call(["livestreamer", "twitch.tv/"+user,quality,"-o",directory+filename])
            print("Stream is done. Going back to checking..")
            time.sleep(15)

def main():
    global refresh
    global user
    global quality
    global directory

    refresh = 30.0
    user = "sips_"
    quality = "high"
    directory = "/home/arch/Desktop/twitchscrape/"

    client = False
    clientID = "http-header=Client-ID=jzkbprff40iqj646a697cyrvl0zt2m6"
    dir_path = '/home/arch/.livestreamerrc'

#    file = open(dir_path, 'r')
#    for line in file:
#        if line == clientID:
#            client = True
#    file = open(dir_path, 'a')
#        if client != True:
#            file.write(clientID)
#    file.close()

    if(refresh<15):
        print("Check interval should not be lower than 15 seconds")
        refresh=15

    print("Checking for",user,"every",refresh,"seconds. Record with",quality,"quality.")
    loopcheck()


if __name__ == "__main__":
    # execute only if run as a script
    main()
