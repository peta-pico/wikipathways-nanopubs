#!/bin/bash
#
# Usage:
# 
# $ scripts/preprocess-input.sh 20161210
# 


echo "uncompressing raw files..."

cp input/raw/wp_nanopubs_$1.tar.gz input/raw-uncompressed
cd input/raw-uncompressed
tar -zxf wp_nanopubs_$1.tar.gz
rm wp_nanopubs_$1.tar.gz
cd ../..


echo "merging input files..."

cat input/raw-uncompressed/$1/complexes.wp*.trig \
  | gzip \
  > input/complexes/$1.trig.gz

cat input/raw-uncompressed/$1/interactions.wp*.trig \
  | gzip \
  > input/interactions/$1.trig.gz

cat input/raw-uncompressed/$1/pathwayParticipation.wp*.trig \
  | gzip \
  > input/pathwayParticipation/$1.trig.gz

