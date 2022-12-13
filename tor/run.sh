#!/bin/bash

if [ -d /persistent/hidden ]; then
	cat /persistent/hidden/hostname
else
	mkp224o -q -d news -n 1 "$PROJECT"
	mv news/*.onion /persistent/hidden
	rm -rf news
fi

cp -rv /persistent/hidden /var/lib/tor/hidden_service
chown -R root /var/lib/tor/hidden_service
cat << EOF >  /etc/tor/torrc
Log err stdout
RunAsDaemon 0
User root
DataDirectory /var/lib/tor
PublishServerDescriptor 0
EntryNodes {nl}{fr}{se}{fi}{dk} StrictNodes 1
HiddenServiceDir /var/lib/tor/hidden_service/
EOF
if [ -f /persistent/services ]; then
	chown -R root /var/lib/tor
	cat /persistent/services >>  /etc/tor/torrc
	cat /persistent/services
	cat /persistent/hidden/hostname
    /usr/bin/tor
else
	echo "persistent/services not exists"
fi
