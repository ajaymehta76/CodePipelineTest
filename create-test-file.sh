#!/bin/bash

## Script to create file with current timestamp

USAGE="create-test-files.sh <timezone> <root directory> <file prefix>"

EXAMPLE="create-test-files.sh America/Indianapolis /home/ec2-user testfile"

if [[ $# -ne 3 ]]; then
  echo ""
  echo "Usage $USAGE"
  echo ""
  echo "Example: $EXAMPLE"
  echo ""
  exit 0
fi

tz="$1"
ROOTDIR=$2
FILEPREFIX=$3

DIRNAME=$ROOTDIR/$(TZ=$tz date +%m-%d)
FILENAME=$FILEPREFIX-$(TZ=$tz date +%H-%M).txt

mkdir -p $DIRNAME
dt=$(TZ=$tz date)

echo "Current date and time is $dt" > $DIRNAME/$FILENAME

