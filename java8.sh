#!/bin/bash
# to use
# source java8.sh
# alias java8='source java8.sh'

JAVA8=$(cygpath -ua "C:\Program Files\Java\jdk1.8.0_144")

export JAVA_HOME=$JAVA8


OLD_IFS=$IFS
export IFS=':'
CYGWIN=nodosfilewarning
PATHNEW=''

PATHS=($(echo $PATH))

for A in ${PATHS[@]}
do

  if [[ "$A" != *"Java"* || "$A" != *"jdk"* || "$A" == *"java"* ]] 
  then
    PATHNEW=$PATHNEW:"$A"
  fi
done

export IFS=$OLDIFS


export PATH=$JAVA_HOME/bin$PATHNEW

# Output
echo -e "JAVA_HOME\t" $JAVA_HOME
echo -e "PATH"
for A in ${PATH}
do
  echo "${A}"
done
