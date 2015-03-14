#!/bin/bash

#Check whether user is root
if [ $(id -u) != "0"  ]; then
	echo "You should be a root user to run this  script!"
	echo "Error -- No root user"
	exit 1
fi

clear
echo "======================================================"
echo "This is a auto_index page added scripts"
echo "======================================================"

if [ "$1" != "--help"  ]; then
	domain='hostname'
	echo "Please input your domain that you want to add:"
	read -p "default domain is $domain:" domain
	if [ "$domain" = ""  ]; then
		echo "Error:domain shoulded be empty!"
		exit 1
	fi
	ip_port=""
	echo "Input your IPv4/IPv6 address:port"
	echo "Ipv6 format is [2001:38::1]:80 (example)"
	read -p "Input IP Address:" ip_port
	echo "The data $ip_port has no checked ,Remember"

	conf_location=/etc/nginx/conf.d/
	echo "Input your conf location: "
	read -p "default domain is $conf_location:" conf_location
	if [ ! -d "$conf_location" ]
		echo "OK! This folder exists!"
	else
		echo "Error , Check configure folder exists!"
		exit 1
	fi

else
	echo 
