#!/bin/bash
# tomcat server start on cygwin

export JAVA_OPTS="-Dfile.encoding=UTF-8 -Dhttps.proxyHost=10.209.25.105 -Dhttps.proxyPort=8080 -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=6013 -Xmx784m -XX:MaxPermSize=128m"
export CATALINA_BASE="/c/conf/jp-front"
export CATALINA_HOME="/c/apache-tomcat-6.0.35"
export JRE_HOME="/c/Program Files (x86)/Java/jdk1.6.0_45"


/c/apache-tomcat-6.0.35/bin/catalina.sh run &

