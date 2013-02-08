#!/bin/sh

awk -- '
BEGIN {
found=0;
split(ARGV[2], iv, "_");
interface=iv[1];
value=iv[2];
}
{
	if ( $1 == "iface" && $2 == interface) {
		if(found == 1) {
			exit 0;
		}
		found=1;
		next;
	}

	if( found == 1 && $1 == value) {
		print $2
		exit 0;
	}

	if ( $1 == "BEGIN" ) {
		exit 0;
	}

	next;
}
' /etc/network/interfaces $0
