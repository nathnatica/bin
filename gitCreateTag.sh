#!/bin/bash

if [ `git branch | grep '*' | grep 'release' | wc -l` -eq 0 ]; then
	echo "!! THIS BRANCH IS NOT A RELEASE BRANCH !!"
	exit 1;
fi

TAG_VERSION=`git branch | grep '*' | cut -d '/' -f 2`
echo "-- TAG_VERSION : ${TAG_VERSION}"
DATE="`date '+%Y%m%d'`"
echo "-- TAGS CREATED TODAY"
echo "`git tag | grep ${TAG_VERSION}/${DATE}`"
TAG_COUNT_CREATED_TODAY="`git tag | grep ${TAG_VERSION}/${DATE} | wc -l`"
echo "-- TAG COUNT CREATED TODAY : ${TAG_COUNT_CREATED_TODAY}"
NEW_TAG_NAME="tags/${TAG_VERSION}-${DATE}-0$((TAG_COUNT_CREATED_TODAY+1))"

echo ""
echo ">> NEW TAG NAME TO CREATE <<"
echo "!! TO CREATE A NEW TAG USE 'y' AS PARAMETER !!"
echo "${NEW_TAG_NAME}"

if [ "${1}" == "y" ]; then
	echo ">> CREATE A TAG : ${NEW_TAG_NAME}"
	git tag "${NEW_TAG_NAME}"
fi