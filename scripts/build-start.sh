#!/bin/bash
#
# Usage:
#
# $ scripts/build-start.sh complexes 20160610
# $ scripts/build-start.sh interactions 20160610
# $ scripts/build-start.sh pathwayParticipation 20161110
#
# (The first five releases don't contain any pathwayParticipation nanopubs.)
#

mkdir -p output/$1

echo "file,reusableCount,inputCount,reuseCount,topicMatchCount,intopicDuplCount,outTopicDuplCount,topicMatchErrors" \
  >> stats/$1_ctable.csv
echo "file,reuseCount" \
  >> stats/$1_itable.csv

np op reuse -n -s \
  -o output/$1/$2_full.trig.gz \
  -c output/cache/$1/$2_cache.txt.gz \
  -r stats/$1_ctable.csv \
  -f '-h WikipathwaysFingerprints' \
  -t '-h WikipathwaysTopics' \
  input/$1/$2.trig.gz \
  &> reports/$1/$2_report.txt

np op ireuse -s \
  -o output/$1/$2_index.trig.gz \
  -r stats/$1_itable.csv \
  -T "Nanopubs covering $1 extracted from WikiPathways version $2" \
  -C "0000-0001-7542-0286" \
  -C "0000-0002-1267-0234" \
  output/cache/$1/$2_cache.txt.gz \
  &>> reports/$1/$2_report.txt
