#!/bin/bash

export AWS_PROFILE=myprofile

function dumpstreams() {
  aws logs describe-log-streams \
    --order-by LastEventTime --log-group-name $LOGGROUP \
    --output text | while read -a st; do
      [ "${st[4]}" -lt "$starttime" ] && continue
      stname="${st[1]}"
      echo ${stname##*:}
    done | while read stream; do
      aws logs get-log-events \
        --start-from-head --start-time $starttime \
        --log-group-name $LOGGROUP --log-stream-name $stream --output text \
        > a.log
    done
}

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
