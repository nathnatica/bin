#!/bin/bash

echo "applying stash $1"
git stash apply `git stash list | grep "$1" | cut -d ':' -f 1`

