#!/bin/bash
#Bash v4.0+ has inbuilt support for setting up a step value using {START..END..INCREMENT} syntax:
echo "Bash version ${BASH_VERSION}..."
for i in {0..10..2}
  do
     echo "Welcome $i times"
 done