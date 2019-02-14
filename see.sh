#!/bin/bash

for file in ${1};
do
    echo ""
    echo "-------------------------"
    echo "`basename ${file}`"
    echo "-------------------------"
    cat ${file}
done

