#!/bin/bash
echo "Enter the string"
read str
if [[ $str == *condition* ]]
then
	echo "String "$str has the word \"condition\"
fi

#$ ./enhanced.sh
#Enter the string
#conditionalstatement
#String conditionalstatement has the word "condition"
#[ is a synonym for test command. Even if it is built in to the shell it creates a new process.
#[[ is a new improved version of it, which is a keyword, not a program.
#[[ is understood by Korn and Bash.
#In the above example, if the variable $str contains the phrase “condition” anywhere, the condition is true.
#This is the shell globbing feature, which will be supported only when you use [[ (double brackets) and therefore many arguments need not be quoted.