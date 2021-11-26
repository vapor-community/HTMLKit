#!/bin/sh
PERCENT="$(cat "$1" | jq ".data.totals.percent")"
THRESHOLD="$2"
if [ "${PERCENT%.*}" -ge "$THRESHOLD" ]
then
  echo "Looking good with $PERCENT% coverage"
  exit 0
else
  echo "Only $PERCENT% coverage. Needs $THRESHOLD% or more"
  exit 1
fi
