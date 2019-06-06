#!/bin/bash
# addsuffix <suffix> <files>

suffix=$1
shift
for f in "$@"
do
  extension=${f##*.}
  if [ -z $extension ]; then
    mv "$f" "$f$suffix"
  else
    mv "$f" "$f$suffix"
# add sufffix before extension(but not expected)
#    mv "$f" "${f%.$extension}$suffix.$extension"
  fi
done

