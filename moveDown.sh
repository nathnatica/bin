#! /bin/bash

#move down files have name matched with keyword paramter2 in subdirectory parameter1
# input : subdirectory keyword


SRC=`pwd`
DEST=`pwd`/$1
KEYWORD=$2

if [ ! -d "$DEST" ];then
  mkdir $DEST
fi

ORI_IFS=$IFS
IFS=$'\t\n'

FILES=`find . -maxdepth 1 -type f -iname "*$KEYWORD*"`

for f in $FILES
do
  mv "$SRC/$f" "$DEST/$f"
done

IFS=$ORI_IFS
