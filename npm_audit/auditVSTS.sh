#!/bin/sh



for project in `egrep -v '^[[:space:]]*$|^ *#' projects.txt` ; do
    echo "[INFO] audit for $project"
    ./audit.sh $project 
    echo "[INFO] done $project"
done
#print results
 find . -maxdepth 2 -name "audit.txt" -print -exec cat {} \; > audits.txt
#package 
find . -maxdepth 2 -name "audit.txt" |xargs audit.`date +"%F"`.zip 
#clean
find . -maxdepth 2 -name "audit.txt" |xargs rm 