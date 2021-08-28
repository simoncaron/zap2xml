#!/bin/sh

# start cron
#/usr/sbin/crond -f -l 8

while :
do
	DATE=`date`
	/zap2xml.pl -U -o /data/$XMLTV_FILENAME $OPT_ARGS
	echo "Last run time: $DATE"

	if [[ "$SLEEPTIME" -gt "0" ]]; then
		echo "Will run in $SLEEPTIME seconds"
		sleep $SLEEPTIME
	else
		exit 0
	fi
done
