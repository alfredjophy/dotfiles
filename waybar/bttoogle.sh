#!/bin/bash
status=$(/usr/bin/bluetooth|awk '{print $3}' )

if [ $status == 'on' ] ;then 
	/usr/bin/rfkill block 1
else
	/usr/bin/rfkill unblock 1
fi
exit
