#!/bin/bash
if [ `whoami` != 'root' ]; then
	echo "Executing the installer script"
	./home/oracle/databases/runInstaller.sh
else
	echo "Root is not allowed to execute the installer script"
fi