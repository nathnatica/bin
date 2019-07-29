#!/bin/bash
# copy empty excel file and open

cd
TEMPLATE="desktop/__etcs/empty.xlsx"
FILE="desktop/`date '+%Y%m%d'`_調査"

if [ -f ${FILE}.xlsx ];then
	for i in `seq 2 9`;
	do	
		if [ ! -f ${FILE}${i}.xlsx ];then
			FILE=${FILE}${i}
			break
		fi
	done
	
fi

cp ${TEMPLATE} ${FILE}.xlsx
cygstart -o ${FILE}.xlsx
cd -