#!/bin/bash

# move up all files under specified folder
# input : folder

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

DEST=`pwd`/$1

FILES=`find -f $DEST`

COUNTER=0

for ORIG in $FILES
do
	ORIG=`dirname $ORIG`/`basename $ORIG`
	if [[ -f $ORIG && ! -d $ORIG ]]; then
		file=`basename $ORIG`
		destFile=$DEST/$file
		if [[ ! -f $destFile ]]; then
		  echo $ORIG " > " $destFile
		  mv -n $ORIG $destFile
		fi
		if [[ -f $destFile ]]; then
		  let COUNTER=COUNTER+1
		  fileName=${file%.*}
		  extension=${file##*.}
		  echo $file " >> " $fileName"("$COUNTER")."$extension
                  destFile="$DEST/$fileName($COUNTER).$extension"
		  mv -n $ORIG $destFile
		fi
	fi
done
IFS=$SAVEIFS
