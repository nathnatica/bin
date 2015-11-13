#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import datetime

dir=sys.argv[1]

#for dirpath, dirnames, filenames in os.walk(dir):
#	for file in filenames:
#		curpath = os.path.join(dirpath, file)
#		if file.endswith('.log'):
#			os.remove(curpath)

def flushdir(dir):
	for f in os.listdir(dir):
		fullpath = os.path.join(dir, f)
		if os.path.isdir(fullpath) and f.endswith('logs'):
			flushdir(fullpath)
		if os.path.isfile(fullpath) and f.endswith('log'):
			file_modified = datetime.datetime.fromtimestamp(os.path.getmtime(fullpath))
			if (datetime.datetime.now() - file_modified > datetime.timedelta(hours=12)):
				try:
					os.remove(fullpath)
				except:
					pass

flushdir(dir)
