#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import commonImgCrawler

imgUrlPattern = r'src="(http://[0-9a-z\.]+/(image|original)/[0-9A-Z]+)"'

if len(sys.argv) == 4 :
	commonImgCrawler.crawlingSite('tistory2.py', sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), imgUrlPattern)
elif len(sys.argv) == 1 :
	commonImgCrawler.crawlingSites('tistory2.py', imgUrlPattern)
	pass


