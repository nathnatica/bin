#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import os
import re

p = re.compile(r'.*[0-9]+\.(jpg|gif|png)+')

def changeName(path, name) :
	if len(name) < 20 :
		global p
		if p.match(name) :
			filename, extension = os.path.splitext(name)
			name1 = filter(str.isalpha, filename)
			name2 = filter(str.isdigit, filename)
			name2 = name2.zfill(9)
			rename = name1 + name2 + extension
			print rename
			os.rename(os.path.join(path,name), os.path.join(path, rename))



def doRename(path) :
	print os.path.abspath(path)
	if os.path.exists(path) :
		for f in os.listdir(path) :
			if os.path.isdir(os.path.join(os.path.abspath(path), f)) :
				doRename(os.path.join(os.path.abspath(path), f))
			else :
				changeName(os.path.abspath(path), f)


path = sys.argv[1]
doRename(path)
