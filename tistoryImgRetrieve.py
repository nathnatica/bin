#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import urllib
import requests
import re
import os
import random
import string

if len(sys.argv) < 3:
	sys.exit("Usage python command.py arg1(domain) arg2(article no.)")

url = sys.argv[1] + sys.argv[2]

outDir = "/Users/natica/Downloads/" + sys.argv[1] + "_" + sys.argv[2]

print url

p = re.compile(r'src="(http://[0-9a-z\.]+/(image|original)/[0-9A-Z]+)"')

response = requests.get("http://" + url, stream=True)
for line in response.iter_lines() :
	if line :
		for m in p.finditer(line):
			if not os.path.exists(outDir):
				os.makedirs(outDir)
			name = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(12))
			urllib.urlretrieve(m.group(1), outDir + "/" + name + ".jpg")		
			print m.group(1)
