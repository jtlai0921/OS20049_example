#!/bin/sh
#
DIALER_SCRIPT=/etc/ppp/ppp-on-dialer
#
exec /usr/sbin/pppd lock modem crtscts /dev/ttyS0 38400 \
	noipdefault defaultroute connect $DIALER_SCRIPT

