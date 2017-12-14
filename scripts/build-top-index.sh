#!/bin/bash
#
# Usage:
#
# $ scripts/build-top-index.sh 20161210
#


mkdir -p output/top

INDEX_COMPLEXES=`
  cat reports/complexes/$1*_report.txt \
  | egrep '^Index URI: ' | tail -1 | sed 's/Index URI: //'
`

INDEX_INTERACTIONS=`
  cat reports/interactions/$1*_report.txt \
  | egrep '^Index URI: ' | tail -1 | sed 's/Index URI: //'
`

if [ -f reports/pathwayParticipation/${1}*_report.txt ]; then
  INDEX_PWPARTICIPATION=`
    cat reports/pathwayParticipation/$1*_report.txt \
    | egrep '^Index URI: ' | tail -1 | sed 's/Index URI: //'
  `
fi

SUB="-s $INDEX_COMPLEXES -s $INDEX_INTERACTIONS"
if [ $INDEX_PWPARTICIPATION ]; then
  SUB="$SUB -s $INDEX_PWPARTICIPATION"
fi


PREVIOUS=`
  cat reports/top-indexes_report.txt \
  | egrep '^Index URI: ' | tail -1 | sed 's/Index URI: //'
`
SUPERSEDE=""
if [ $PREVIOUS ]; then
  SUPERSEDE="-x $PREVIOUS"
fi

(
  echo "$1";
  np mkindex \
    -t "Nanopublications extracted from WikiPathways, incremental dataset, $1" \
    -c "0000-0001-7542-0286" \
    -c "0000-0002-1267-0234" \
    $SUB \
    $SUPERSEDE \
    -o output/top/${1}_top-index.trig.gz
) >> reports/top-indexes_report.txt

