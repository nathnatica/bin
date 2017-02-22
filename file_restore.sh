#!/bin/bash

if [[ -f $1 ]]; then
	for i in `cat $1`;
	do
		echo '[RESTORE] ' backup/$i ' >>> ' `dirname $i`;
		cp backup/$i `dirname $i`;
	done
else
	echo "need input file"
fi


