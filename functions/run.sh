#!/bin/bash 
function run() {
    number=$1
    shift
    for n in $(seq $number); do
      $@
    done
}

run 10 echo "I WILL STUDY LINUX FOR WEDNESDAYS SESSION"