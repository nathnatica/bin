#!/bin/bash
# tomcat server stop on cygwin

export CATALINA_BASE="/c/conf/jp-front"
export CATALINA_HOME="/c/apache-tomcat-6.0.35"
export JRE_HOME="/c/Program Files (x86)/Java/jdk1.6.0_45"


/c/apache-tomcat-6.0.35/bin/catalina.sh stop &

