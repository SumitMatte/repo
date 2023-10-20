#!/bin/bash

dumpstreams() {
  aws $AWSARGS logs describe-log-streams \
    --order-by LastEventTime --log-group-name $LOGGROUP \
    --output text | while read -a st; do
      [[ "${st[4]}" =~ ^[0-9]+$ ]] && [ "${st[4]}" -lt "$starttime" ] && continue
      stname="${st[1]}"
      echo ${stname##*:}
    done | while read stream; do
      aws $AWSARGS logs get-log-events \
        --start-from-head --start-time $starttime \
        --log-group-name $LOGGROUP --log-stream-name $stream --output text \
        --output text > a.log
    done
}

AWSARGS="--profile myprofile --region ap-south-1"
LOGGROUP="/var/log/messages"
TAIL=
starttime=$(date --date "-1 week" +%s)000
nexttime=$(date +%s)000
dumpstreams

if [ -n "$TAIL" ]; then
  while true; do
    starttime=$nexttime
    nexttime=$(date +%s)000
    sleep 1
    dumpstreams
  done
fi
