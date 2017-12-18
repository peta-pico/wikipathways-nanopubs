#!/bin/bash
#
# Usage:
# $ scripts/combine-output.sh 20161210
#

# Full

mkdir -p output/combined

cat output/complexes/$1_full.trig.gz \
  | gunzip \
  > output/combined/$1_full.trig

cat output/interactions/$1_full.trig.gz \
  | gunzip \
  >> output/combined/$1_full.trig

if [ -f output/pathwayParticipation/$1_full.trig.gz ]; then
  cat output/pathwayParticipation/$1_full.trig.gz \
    | gunzip \
    >> output/combined/$1_full.trig
fi

cat output/combined/$1_full.trig \
  | gzip \
  > output/combined/$1_full.trig.gz

rm output/combined/$1_full.trig


# New

mkdir -p output/combined

touch output/combined/$1-xx_new.trig

if [ -f output/complexes/$1-*_new.trig.gz ]; then
  cat output/complexes/$1-*_new.trig.gz \
    | gunzip \
    > output/combined/$1-xx_new.trig
fi

if [ -f output/interactions/$1-*_new.trig.gz ]; then
  cat output/interactions/$1-*_new.trig.gz \
    | gunzip \
    >> output/combined/$1-xx_new.trig
fi

if [ -f output/pathwayParticipation/$1-*_new.trig.gz ]; then
  cat output/pathwayParticipation/$1-*_new.trig.gz \
    | gunzip \
    >> output/combined/$1-xx_new.trig
fi

cat output/combined/$1-xx_new.trig \
  | gzip \
  > output/combined/$1-xx_new.trig.gz

rm output/combined/$1-xx_new.trig


# Full Index

mkdir -p output/combined

cat output/complexes/$1_index.trig.gz \
  | gunzip \
  > output/combined/$1_index.trig

cat output/interactions/$1_index.trig.gz \
  | gunzip \
  >> output/combined/$1_index.trig

if [ -f output/pathwayParticipation/$1_index.trig.gz ]; then
  cat output/pathwayParticipation/$1_index.trig.gz \
    | gunzip \
    >> output/combined/$1_index.trig
fi

cat output/top/$1_top-index.trig.gz \
    | gunzip \
    >> output/combined/$1_index.trig

cat output/combined/$1_index.trig \
  | gzip \
  > output/combined/$1_index.trig.gz

rm output/combined/$1_index.trig


# New Index

mkdir -p output/combined

touch output/combined/$1-xx_index.trig

if [ -f output/complexes/$1-*_index.trig.gz ]; then
  cat output/complexes/$1-*_index.trig.gz \
    | gunzip \
    > output/combined/$1-xx_index.trig
fi

if [ -f output/interactions/$1-*_index.trig.gz ]; then
  cat output/interactions/$1-*_index.trig.gz \
    | gunzip \
    >> output/combined/$1-xx_index.trig
fi

if [ -f output/pathwayParticipation/$1-*_index.trig.gz ]; then
  cat output/pathwayParticipation/$1-*_index.trig.gz \
    | gunzip \
    >> output/combined/$1-xx_index.trig
fi

cat output/top/$1_top-index.trig.gz \
    | gunzip \
    >> output/combined/$1-xx_index.trig

cat output/combined/$1-xx_index.trig \
  | gzip \
  > output/combined/$1-xx_index.trig.gz

rm output/combined/$1-xx_index.trig
