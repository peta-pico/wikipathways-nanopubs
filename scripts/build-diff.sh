#!/bin/bash
#
# Usage:
#
# $ scripts/build-diff.sh complexes 20161110 20161210
#

np op reuse -n -s \
  -x output/$1/$2_full.trig.gz \
  -o output/$1/$3-$2_new.trig.gz \
  -a output/$1/$3_full.trig.gz \
  -c output/cache/$1/$3_cache.txt.gz \
  -r stats/$1_ctable.csv \
  -t '-h WikipathwaysTopics' \
  -f '-h WikipathwaysFingerprints' \
  input/$1/$3.trig.gz \
  &> reports/$1/$3-$2_report.txt

np op ireuse -s \
  -x output/$1/$2_index.trig.gz \
  -o output/$1/$3-$2_index.trig.gz \
  -a output/$1/$3_index.trig.gz \
  -r stats/$1_itable.csv \
  -T "Nanopubs covering $1 extracted from WikiPathways version $3" \
  -C "0000-0001-7542-0286" \
  -C "0000-0002-1267-0234" \
  output/cache/$1/$3_cache.txt.gz \
  &>> reports/$1/$3-$2_report.txt

