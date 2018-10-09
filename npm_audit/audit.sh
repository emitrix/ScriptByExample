#!/bin/sh
# AUTOR: jaimegaona <jaime.gaona@accenture.com>
# Created: 2018.10.04

help(){
    echo "This script will downlaoad the project provided as parameter and try to run an npm audit"
    echo "run : $0 <project> "
    exit 1
}

npm_audit(){
    if [ -f package.json ]
        then 
        echo  "[INFO] nodeJS appliaction"
        cp ../.npmrc .npmrc 
        npm install  && npm audit --parseable > audit.txt && npm audit > auditExtended.txt
    fi
}

## Star of script
if [ -z $1 ] 
  then
    help
fi

export PROJECT=$1

if [ -d $PROJECT ] 
  then    
    #Folder exist and asume that dev branch already exist.
    echo "[INFO] updating project ${PROJECT}"
    cd $PROJECT
    git checkout dev &&  git pull 
    npm_audit
  else
    #Folder not exist, need to dowload and get dev branch.
    echo "[INFO] downloading project ${PROJECT}"
    git clone PressGaneyEI@vs-ssh.visualstudio.com:v3/PressGaneyEI/$1/$1 && cd $1 && git checkout -b dev remotes/origin/dev
    cd $PROJECT
    npm_audit
fi 
