#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import urllib
import requests
import re
import os
import random
import string
import ConfigParser

config = ConfigParser.ConfigParser()
config.read("./scriptSetting.ini")

requests.adapters.DEFAULT_RETRIES = 30

latestImgUrl = ""

def crawlingPage(domain, articleId):
	outDir = config.get('tistory.py','out.dir') + domain + articleId
	url = domain + articleId

	p = re.compile(r'src="(http://[0-9a-z\.]+/(image|original)/[0-9A-Z]+)"')

	response = requests.get("http://" + url, stream=True)
	for line in response.iter_lines() :
		if line :
			for m in p.finditer(line):
				if not os.path.exists(outDir):
					os.makedirs(outDir)
				name = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(12))
				imgurl = m.group(1).replace("/image/","/original/")
				global latestImgUrl
				if (imgurl == latestImgUrl) :
					print "[DUPLICATED] " + imgurl 
					continue
				else :
					latestImgUrl = imgurl
				imgurl = imgurl.replace(".jpg", "")
				outFilePath = outDir + "/" + imgurl[imgurl.rfind("/")+1:] + ".jpg"
				if (os.path.isfile(outFilePath)):
					print "[SKIPPED] " + outFilePath
				else :
					urllib.urlretrieve(imgurl, outFilePath)		
					print imgurl
	if (os.path.isdir(outDir)) :
		path, dir, files = os.walk(outDir).next()
		if (len(files) < 1) :
			os.rmdir(outDir)
	


crawlingPageCount = 10

fi = open(config.get('tistory.py','out.file'),"r")
if (os.path.exists(config.get('tistory.py','out.temp.file'))) :
	os.remove(config.get('tistory.py','out.temp.file'))
	
fo = open(config.get('tistory.py','out.temp.file'),"a+")
for line in fi:
	if (len(line) > 2):
		print "===================================="
		if (line.startswith("#")) :
			fo.write(line + "\n")
			continue;
		print line
		splitted = line.split("\t")
		url = splitted[0]
		
		maxArticleId = 0
		if os.path.exists(config.get('tistory.py','out.dir') + url):
			for fn in os.listdir(config.get('tistory.py','out.dir') + url):
				try :
					tmp = int(fn)
					if (tmp > maxArticleId) :
						maxArticleId = tmp
				except :
					continue

		for i in range(maxArticleId - 10, maxArticleId + 1 + crawlingPageCount) :
			print "[CRAWLING] " + url + str(i)
			crawlingPage(url, str(i))				
		fo.write(url + "\t" + str(i) + "\n")
fo.close()
fi.close()

os.remove(config.get('tistory.py','out.file'))
os.rename(config.get('tistory.py','out.temp.file'), config.get('tistory.py','out.file'))


