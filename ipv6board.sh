#!/usr/bin/env sh

##################################################################################
#
#  Copyright (C) 2019 Craig Miller
#
#  See the file "LICENSE" for information on usage and redistribution
#  of this file, and for a DISCLAIMER OF ALL WARRANTIES.
#  Distributed under GPLv2 License
#
##################################################################################


#
#	Script creates hex ping6 command for ipv6board
#		
#		https://ipv6board.best-practice.se/
#
#	by Craig Miller		18 Aug 2019

#	
#	Assumptions:
#		message limited to 8 characters
#		
#
#	TODO: 
#		provide feedback on number of chars input
#		
#		
VERSION=0.96

usage () {
               echo "	$0 - write messages to ipv6board with ping6 "
	       echo "		https://ipv6board.best-practice.se/	"
	       echo "	"
	       echo "	e.g. $0 \"my msg\" "
	       echo "	-h  this help"
	       echo "	"
	       echo " By Craig Miller - Version: $VERSION"
	       exit 1
           }

# check OS type (BSD or Linux)
OS=""
OS=$(uname -s)
if [ "$OS" = "Darwin" ] || [ "$OS" = "FreeBSD" ]; then
	# MacOS X/BSD compatibility
	ping_opts="-c 1 -i 1 "
else
	ping_opts="-c 1 -w 1 "
fi

# Initialize vars
space=" "

# IPv6Board prefix
prefix="2001:6b0:1001:105:"

#show help
if [ "$1" = "-h" ]; then 
	usage
fi

msg="$1"

# get length of msg
len=${#msg}

# pad msg with spaces until 8 chars long
while [ "$len" -lt 8 ]; do
	msg=$msg$space
	len=${#msg}
done

# convert message to ascii using hexdump and awk to format into IID address
msghex=$(echo "$msg" | hexdump -C | head -1 | awk '{print $2$3":"$4$5":"$6$7":"$8$9}')

# debug using -d as second parameter
if [ "$2" = "-d" ]; then
	#debug echo
	echo "ping6 $ping_opts $prefix$msghex"
else
	#ping the ipv6board with message
	ping6 $ping_opts "$prefix$msghex"
fi

echo "pau"
