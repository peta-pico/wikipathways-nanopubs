#!/bin/bash
#
# Usage:
#
# $ scripts/build-top-index.sh 20161110 20161210
#


mkdir -p output/top

INDEX_COMPLEXES=`
  cat reports/complexes/$2*_report.txt \
  | egrep '^Index URI: ' | tail -1 | sed 's/Index URI: //'
`

INDEX_INTERACTIONS=`
  cat reports/interactions/$2*_report.txt \
  | egrep '^Index URI: ' | tail -1 | sed 's/Index URI: //'
`

if [ -f reports/pathwayParticipation/${2}*_report.txt ]; then
  INDEX_PWPARTICIPATION=`
    cat reports/pathwayParticipation/$2*_report.txt \
    | egrep '^Index URI: ' | tail -1 | sed 's/Index URI: //'
  `
fi

SUB="-s $INDEX_COMPLEXES -s $INDEX_INTERACTIONS"
if [ $INDEX_PWPARTICIPATION ]; then
  SUB="$SUB -s $INDEX_PWPARTICIPATION"
fi

PREVIOUS=`
  cat reports/top-indexes_report.txt \
  | sed -r '{N;s/^([0-9]*)\nIndex URI:/\1/g}' \
  | egrep "^$1" | sed -r 's/^[0-9]* //'
`
SUPERSEDE=""
if [ $PREVIOUS ]; then
  SUPERSEDE="-x $PREVIOUS"
fi

(
  echo "$2";
  np mkindex \
    -t "Nanopublications extracted from WikiPathways, incremental dataset, $2" \
    -c "0000-0001-7542-0286" \
    -c "0000-0002-1267-0234" \
    $SUB \
    $SUPERSEDE \
    -o output/top/${2}_top-index.trig.gz
) >> reports/top-indexes_report.txt

