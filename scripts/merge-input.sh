#!/bin/bash
#
# Usage: scripts/merge-input.sh 20161210
# 

cat input/raw-uncompressed/$1/complexes.wp*.trig \
  | gzip \
  > input/complexes/$1.trig.gz

cat input/raw-uncompressed/$1/interactions.wp*.trig \
  | gzip \
  > input/interactions/$1.trig.gz

cat input/raw-uncompressed/$1/pathwayParticipation.wp*.trig \
  | gzip \
  > input/pathwayParticipation/$1.trig.gz

