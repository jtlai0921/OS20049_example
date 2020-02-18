#!/bin/sh
#
TELEPHONE=phonenumber      # The telephone number for the connection
LOGIN=login                # The login identifier used with the ISP
PASSWORD=password          # The password for loki's account on its ISP

DIALSCRIPT=/tmp/dialscript.$$

trap "rm -f ${DIALSCRIPT}" exit INT HUP QUIT

umask 066
cat <<EOF > ${DIALSCRIPT}
TIMEOUT 3
ABORT '\nBUSY\r'
ABORT '\nNO CARRIER\r'
ABORT '\nNO ANSWER\r'
'' '\nAT\r'
OK ATDT$TELEPHONE
TIMEOUT 30
'ion.' '\r\d\r\d\r'
ogin:--ogin: $ACCOUNT
assword: $PASSWORD
EOF

/usr/sbin/chat -v -f ${DIALSCRIPT
