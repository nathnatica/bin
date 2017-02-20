#!/bin/sh

BASE_DIR=$(dirname $(dirname $(readlink -f $0)))
LOG_DIR=${BASE_DIR}/logs
PID_FILE=${LOG_DIR}/gitbucket.pid

if [ -f ${PID_FILE} ]; then
  kill $(cat ${PID_FILE})
  rm -f ${PID_FILE}
fi
