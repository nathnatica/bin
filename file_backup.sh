#!/bin/bash

if [[ -f $1 ]]; then
	rm -rf ./backup
	mkdir backup
	for i in `cat $1`;
	do
		echo '[BACKUP] ' $i '>>> ./backup';
		cp --parents $i ./backup;
	done
else 
	echo "need input file"
fi






