#!/bin/bash
#
# Usage:
# $ scripts/count-index.sh complexes HEADER
# $ scripts/count-index.sh complexes 20161210

if [ $2 == "HEADER" ]; then
  echo "filename,nanopubs,head,assertion,provenance,pubinfo" \
    > stats/$1_icount.csv
  exit
fi

if [ -f output/$1/$2_index.trig.gz ]; then
  npop count \
    -r stats/$1_icount.csv \
    output/$1/$2_index.trig.gz
fi
if [ -f output/$1/$2-*_index.trig.gz ]; then
  npop count \
    -r stas/$1_icount.csv \
    output/$1/$2-*_index.trig.gz
fi
