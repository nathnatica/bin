#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import commonImgCrawler

imgUrlPattern = r'zb_target_resize.*src="?(https?://[0-9a-zA-Z\_\.\/]+)"?.*?>'


if len(sys.argv) == 4 :
        commonImgCrawler.crawlingSite('zeroboard.py', sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), imgUrlPattern)
elif len(sys.argv) == 1 :
	commonImgCrawler.crawlingSites('zeroboard.py', imgUrlPattern)
        pass


