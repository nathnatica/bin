#!/bin/bash

expec.sh "rsync -u -r -v -e ssh maint@10.207.10.31:/home/maint/park/* /home/me/desktop/work/" password;

