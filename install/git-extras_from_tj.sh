#!/bin/bash

(cd /tmp && git clone --depth 1 https://github.com/tj/git-extras.git && cd git-extras && sudo make install)
