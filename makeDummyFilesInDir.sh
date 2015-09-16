#! /bin/bash

for i in $(ls -1);
do 
	/bin/awk -v ORS='\r\n' 'BEGIN{ print "<!-- " "'"$i"'" " START -->"; print "'"$i"'<br />"; print "<!-- " "'"$i"'" " END -->"; }' $i > $i;
done

