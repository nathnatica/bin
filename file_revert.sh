#!/bin/bash

if [[ -f $1 ]]; then
	for i in `cat $1`;
	do
		echo '[REVERT] ' $i;
		git checkout -- $i;
	done
else 
	echo "need input file"
fi






