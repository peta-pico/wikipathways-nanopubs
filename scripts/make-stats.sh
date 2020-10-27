#!/bin/bash
#
# Usage:
# $ scripts/make-stats.sh complexes HEADER
# $ scripts/make-stats.sh complexes 20161210
#


# count content nanopubs:

if [ $2 == "HEADER" ]; then
  echo "filename,nanopubs,head,assertion,provenance,pubinfo" \
    > stats/$1_count.csv
  exit
fi

if [ -f output/$1/$2-*_new.trig.gz ]; then
  np op count \
    -r stats/$1_count.csv \
    output/$1/$2-*_new.trig.gz
fi

if [ -f output/$1/$2_full.trig.gz ]; then
  np op count \
    -r stats/$1_count.csv \
    output/$1/$2_full.trig.gz
fi


# count index nanopubs:

if [ $2 == "HEADER" ]; then
  echo "filename,nanopubs,head,assertion,provenance,pubinfo" \
    > stats/$1_icount.csv
  exit
fi

if [ -f output/$1/$2_index.trig.gz ]; then
  np op count \
    -r stats/$1_icount.csv \
    output/$1/$2_index.trig.gz
fi
if [ -f output/$1/$2-*_index.trig.gz ]; then
  np op count \
    -r stats/$1_icount.csv \
    output/$1/$2-*_index.trig.gz
fi
