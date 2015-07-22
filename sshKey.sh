#!/bin/bash
if [ -z "$1" ]; then
  echo -e "\nUsage: `basename $0` id_rsa.pub"
  exit 1
fi
 
#get the key signature to check if key already exists on server
str=`cat $1 | awk -F" " '{print $3}'`
if [ -z "$str" ]; then
  echo -e "Must specify an id_rsa.pub file as the only argument"
  exit 1
fi
#get the user from the key file to determine what user we should be using
user=`echo $str | awk -F"@" '{print $1}'`
#read serverlist file to get list of servers to install key to
serverFile="./serverlist"
 
declare -a servers
 
index=0
 
while read input
do
  servers[$index]=$input
  index="$index+1"
done < $serverFile
 
j=0
while [ $j -lt ${#servers[@]} ]
do
      echo "Installing SSH key to ${servers[$j]} allow the you to connect without entering a password on the target machine"
      cat $1 | ssh ${servers[$j]} "grep -qs $str .ssh/authorized_keys || (mkdir -p .ssh && cat >> .ssh/authorized_keys && echo Key_installed) && chmod 700 .ssh && chmod 600 .ssh/authorized_keys"
  j=`expr $j + 1`
done

#more about arrays: http://www.cyberciti.biz/faq/bash-for-loop-array/