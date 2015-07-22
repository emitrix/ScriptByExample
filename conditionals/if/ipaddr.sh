#!/bin/bash
echo "Enter the Ipaddress"
read ip

if [ ! -z $ip ]
then
	ping -c 1 $ip
	if [ $? -eq 0 ] ; then
		echo "Machine is giving ping response"
	else
		echo "Machine is not pinging"
	fi
else
	echo "IP Address is empty"
fi
