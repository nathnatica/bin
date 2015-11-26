#!/bin/bash


for f in view*; do 
perl -pe "s/^<.*$//g" $f | perl -pe "s/^.*\"([0-9a-zA-Z\_\:\/\.\-]+)\",\"image\/jpeg\".*$/\1/g" | perl -pe "s/^[^http].*$//g" | perl -pe "s/^https/http/g">> ../../googleImges.txt;
done 

