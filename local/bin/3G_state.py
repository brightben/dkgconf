#!/usr/bin/env python3
from urllib.request import urlopen
import re

def main():
    html = urlopen('http://192.168.0.1/login_data.asp').read().decode()
    def print_arg(arg):
        reobj = re.search(arg + r": '(\S+)'", html)
        print('{:20}{}'.format(arg, (reobj.group(1) if reobj else 'None')))
    
    print_arg('signalbar')
    print_arg('battery_charging')
    print_arg('battery_value')
    print_arg('wifi_status')
    print_arg('wifi_access_count')
    

if __name__=='__main__': main()

