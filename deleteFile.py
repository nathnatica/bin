#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys

path=sys.argv[1]

try:
	os.remove(path)
except:
	pass

