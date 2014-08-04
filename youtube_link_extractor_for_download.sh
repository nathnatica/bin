#!/bin/bash

# extract all youtube links and convert to donwloadable links
# input : youtube watch later page source file

#sed -e 's/^.*\(\/watch\?v=.*\)index.*/http:\/\/ssyoutube.com\1/g;s/\&amp\;[[:space:]]*\>//g' ${1} > ${1}_new.txt
#sed -e 's/^[[:space:]].*\(\/watch\?v=.*\)index.*/http:\/\/ssyoutube.com\1/g;s/^[^h].*$//g;s/\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n/\n/g' ${1} > ${1}_new.txt
sed -e 's/^[[:space:]].*\(\/watch\?v=.*\)index.*/http:\/\/ssyoutube.com\1/g;s/^[^h].*$//g' ${1} > ${1}_new.txt
cat -s ${1}_new.txt > ${1}_replaced.txt
rm ${1}_new.txt 


