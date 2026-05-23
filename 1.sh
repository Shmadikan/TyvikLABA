#!/bin/bashfkmlemkwlfkmewf2

if [ $# -ne 2 ]; then
    echo "Usage: $0 <filename> <duration_seconds>"
    exit 1
fi

FILE=$1
DURATION=$2
END=$((SECONDS + DURATION))

while [ $SECONDS -lt $END ]; do
    LOAD=$(cat /proc/loadavg)
    TIMESTAMP=$(date '+%d.%m.%y %H:%M')
    echo "[$TIMESTAMP = $LOAD]" >> "$FILE"
    sleep 1
done

