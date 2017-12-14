#!/bin/bash
#
# Usage:
# $ scripts/count.sh complexes HEADER
# $ scripts/count.sh complexes 20161210
#

if [ $2 == "HEADER" ]; then
  echo "filename,nanopubs,head,assertion,provenance,pubinfo" \
    > stats/$1_count.csv
  exit
fi

if [ -f output/$1/$2-*_new.trig.gz ]; then
  npop count \
    -r stats/$1_count.csv \
    output/$1/$2-*_new.trig.gz
fi

if [ -f output/$1/$2_full.trig.gz ]; then
  npop count \
    -r stats/$1_count.csv \
    output/$1/$2_full.trig.gz
fi
