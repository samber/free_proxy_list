#!/usr/bin/python2


import urllib2
import sys
import time


proxy_addr = sys.argv[1]
url_test = "https://www.google.com"

begin_timestamp = int(time.time() * 1000)

try:
    proxy = urllib2.ProxyHandler({'http': proxy_addr})
    opener = urllib2.build_opener(proxy)
    urllib2.install_opener(opener)
    result = urllib2.urlopen(url_test)

    end_timestamp = int(time.time() * 1000)

    if result.getcode() == 200:
        print(str(end_timestamp - begin_timestamp) + " " + proxy_addr)

except:
    pass
