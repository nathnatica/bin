#!/bin/bash
#
# ex)
# find ./ -type f -exec newline_at_eof.sh {} \;
#

if [ -z "$(tail -c 1 "$1")" ]
then
	echo "Newline at end of file!    $1"  
else
	echo "No newline at end of file! $1"
fi
