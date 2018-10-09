#!/bin/sh
if [ $1 ]
  then
    echo "getting project $1" 
    git clone PressGaneyEI@vs-ssh.visualstudio.com:v3/PressGaneyEI/$1/$1 && cd $1 && git checkout -b dev remotes/origin/dev
fi    
