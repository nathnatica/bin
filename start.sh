#!/bin/sh

export JAVA_HOME=/usr/java/latest

PORT=8888
BASE_DIR=$(dirname $(dirname $(readlink -f $0)))
WAR_FILE=${BASE_DIR}/bin/gitbucket.war
REPOSITORIES_DIR=${BASE_DIR}
LOG_DIR=${BASE_DIR}/logs
LOG_FILE=${LOG_DIR}/gitbucket.log
PID_FILE=${LOG_DIR}/gitbucket.pid

${JAVA_HOME}/bin/java -jar ${WAR_FILE} --port=${PORT} --gitbucket.home=${REPOSITORIES_DIR} 2>&1 > /dev/null &

echo $! > ${PID_FILE}
