#!/bin/bash
# to use
# source java6.sh
# alias java6='source java6.sh'

JAVA6=$(cygpath -ua "C:\Program Files (x86)\Java\jdk1.6.0_45")

export JAVA_HOME=$JAVA6


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
