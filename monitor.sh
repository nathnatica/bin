#!/bin/bash

tail -f /path/to/file1.log /path/to/file2.log /path/to/file3.log \
 | grep --line-buffered -v "exclude1" \
 | grep --line-buffered -v "exclude2" \
 | grep --line-buffered -v "excludd3" \
 | grep --line-buffered -e " key1" -e "or key2" -e "or key3" -e "or key4" \
 | sed 's/remove_word//';


