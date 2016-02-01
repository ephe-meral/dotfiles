#!/bin/sh
/usr/sbin/portsnap fetch extract update && \
/usr/local/sbin/portmaster -L --index-only | egrep '(ew|ort) version|total install'
echo -n "Last update: "
date -r `pkg query %t | sort | tail -n1` "+%Y%m%d"
echo -n "Steps to be taken: "
/usr/local/sbin/portmaster -na

echo -n "Do you want to upgrade? (y/n)"
read answer
if echo "$answer" | grep -iq "^y" ;then
  echo -n "Upgrading..."
  /usr/local/sbin/portmaster -a
	echo -n "Checking broken deps... (these need manual rebuilding)"
  pkg_libchk
  echo -n "If any ports are listed, feed them to portmaster as a list with no options."
else
  echo -n "Exiting..."
  exit 0
fi
